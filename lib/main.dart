import 'package:flutter/material.dart';
import 'introPage.dart';  // The main Page
import 'todoList.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return new MaterialApp(
      home: IntroPage(),
    );    
  }
}