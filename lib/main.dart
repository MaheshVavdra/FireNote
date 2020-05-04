import 'package:flutter/material.dart';
import 'introPage.dart';  // main Page
//import 'todoList.dart';
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

//Notes: 
//If app crash it may be because o have changed android/app/build.gradle on date:5-April-2020
