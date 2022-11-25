import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                child: Column(
                  children: [

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class TodoListBox extends StatelessWidget {
  const TodoListBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
