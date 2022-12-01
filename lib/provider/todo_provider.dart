import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../vo/todo.dart';

class TodoProvider extends ChangeNotifier{

  List<Todo> currentTodoList=[];




  Future<dynamic> updateComplete({required Todo todo}) async{
    var requestUrl = 'http://3.36.28.140:8080/flutter_coding_boot/todo/updateCom';
    Uri uri = Uri.parse(requestUrl);
    var urlParam = uri.replace(queryParameters: {
      'todo_idx':todo.todoIdx.toString(),
      'complete_ny':todo.completeNy.toString()
    });
    var response = await http.post(urlParam);


    if(utf8.decode(response.bodyBytes)=='ok'){
      Todo t = currentTodoList.firstWhere((element) => element.todoIdx==todo.todoIdx);
      int index = currentTodoList.indexWhere((element) => element.todoIdx==todo.todoIdx);
      t.completeNy=todo.completeNy;
      currentTodoList[index] = t;
      notifyListeners();
    }
    return utf8.decode(response.bodyBytes);
  }


  Future<dynamic> add({required Todo todo}) async{
    var requestUrl = 'http://3.36.28.140:8080/flutter_coding_boot/todo/add';
    Uri uri = Uri.parse(requestUrl);
    var urlParam = uri.replace(queryParameters: {
      'type':todo.type.toString(),
      'title':todo.title.toString(),
    });

    var response = await http.post(urlParam);

    return utf8.decode(response.bodyBytes);
  }


  Future<void> getAll() async{
    var requestUrl = 'http://3.36.28.140:8080/flutter_coding_boot/todo/all';
    Uri uri = Uri.parse(requestUrl);


    var response = await http.get(uri);
    if(response.body.isNotEmpty){
      var jsonList = jsonDecode(utf8.decode(response.bodyBytes));
      for(int i=0;i<jsonList.length;i++){
        var json = jsonList[i];
        currentTodoList.add(Todo.fromJson(json));
      }
    }

    notifyListeners();

  }






}