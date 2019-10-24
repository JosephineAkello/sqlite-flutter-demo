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

Map<String, dynamic> toMap(){
  return {
    'id': id,
    'name' : name,
    'price' : price,
  };
}

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
  Future<void> insertClothes(Clothes clothes) async{
    //get reference to db
    final Database db = database;
 //stores the map into clothes table
 await db.insert('clothes', 
 clothes.toMap(),
 //conflict algorthm is used incase same clothe appears twice
 conflictAlgorithm: ConflictAlgorithm.replace,
 );

  }
}