import 'package:flutter/material.dart';

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