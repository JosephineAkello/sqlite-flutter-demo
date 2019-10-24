import 'package:flutter/material.dart';

void main(){
  runApp(Sqlite());
}

class Sqlite extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Heey'),)
      )
    );
  }
}