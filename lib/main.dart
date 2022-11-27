import 'package:flutter/material.dart';
import 'package:flutter_coding/config/my_app.dart';
import 'package:flutter_coding/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'noto',
        primaryColor: appMainColor,
      ),
      home: HomeScreen(),
    );
  }
}
