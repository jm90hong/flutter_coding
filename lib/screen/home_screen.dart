import 'package:flutter/material.dart';
import 'package:flutter_coding/config/my_app.dart';
import 'package:flutter_coding/screen/page/add_todo_page.dart';
import 'package:flutter_coding/screen/page/todo_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<Widget> pageList =[
    TodoListPage(),
    AddTodoPage(),
    AddTodoPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IndexedStack(
          index: 0,
          children: pageList,
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '공부추가',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: '나의정보',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: appMainColor,
        onTap: (index){

        },
      ),
    );
  }
}



