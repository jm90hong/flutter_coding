
import 'package:flutter/material.dart';

import '../../config/my_app.dart';


class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
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
                child: Column(
                  children: [
                    TodoListBox(),
                    TodoListBox(),
                    TodoListBox(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TodoListBox extends StatelessWidget {


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
              Text('플러터 디자인',style: titleStyle,),
              Text('플러터 디자인 차근 차근 공부하기',style: contentStyle,),
            ],
          ),
          OutlinedButton(
            onPressed: () {

            },
            child: const Text('완료'),
          )
        ],
      ),
    );
  }
}