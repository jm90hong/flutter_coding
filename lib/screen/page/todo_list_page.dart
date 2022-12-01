
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/my_app.dart';
import '../../provider/todo_provider.dart';
import '../../vo/todo.dart';


class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoProvider>(context,listen: false).getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child:Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 24,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('안녕!',style: TextStyle(fontFamily: 'noto_black',fontSize: 20),),
                      Text('나의 코딩공부 리스트',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),)
                    ],
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/image/my.jpg',width: 60,height: 60,fit: BoxFit.cover,)
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child:Consumer<TodoProvider>(
                  builder: (context, todoProvider, child){
                    return Column(
                      children: todoProvider.currentTodoList.map((e) => TodoListBox(
                          title: e.title,
                          type: e.type,
                          isComplete: e.completeNy=='y' ? true : false,
                          onTap: (){
                            Provider.of<TodoProvider>(context,listen: false).updateComplete(todo: Todo(
                              todoIdx: e.todoIdx,
                              completeNy: 'y'
                            ));

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('${e.title} 성공'),
                            ));

                          },
                        )
                      ).toList(),
                    );
                  },
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TodoListBox extends StatelessWidget {

  String type;
  String title;
  bool isComplete;
  Function onTap;

  TodoListBox({
    required this.title,
    required this.type,
    required this.isComplete,
    required this.onTap
  });

  TextStyle titleStyle = TextStyle(color:appMainColor,fontFamily: 'noto_black',fontSize: 16);
  TextStyle contentStyle = TextStyle(color: Colors.black,fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      width: double.infinity,
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(type,style: titleStyle,),
              Text(title,style: contentStyle,),
            ],
          ),
          isComplete ?
            const Text('완료됨',style: TextStyle(color: appMainColor,fontWeight: FontWeight.bold,fontSize: 16),)
          :
            OutlinedButton(
              onPressed: () {
                onTap();
              },
              child: const Text('완료'),
            )
        ],
      ),
    );
  }
}