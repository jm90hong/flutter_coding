import 'package:flutter/material.dart';
import 'package:flutter_coding/config/my_app.dart';
import 'package:flutter_coding/screen/page/add_todo_page.dart';
import 'package:flutter_coding/screen/page/info_page.dart';
import 'package:flutter_coding/screen/page/todo_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int selectedIndex=0;
  List<Widget> pageList =[
    TodoListPage(),
    AddTodoPage(),
    InfoPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
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
            icon: Icon(Icons.info_outline),
            label: '앱 정보',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: appMainColor,
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
      ),
    );
  }
}



