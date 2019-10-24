import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main(){
  runApp(Sqlite());
}

class Clothes {
  final int id;
  final String name;
  final int price;

  Clothes({this.id, this.name,this.price});
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
  Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'clothes_database.db'),
    onCreate: (db, version){
     return db.execute(
       //create clothes table
       'CREATE TABLE clothes(id INTEGER PRIMARY KEY, name TEXT, price INTEGER)'
     );
    },
    version: 1,
  );
}