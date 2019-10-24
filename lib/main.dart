import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main(){
  runApp(Sqlite());
}

class Sqlite extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('FLUTTER SQLITE '),
        ),
        body: Center(
          child: Text('Heey'),)
      )
    );
  }
}