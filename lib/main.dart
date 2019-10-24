import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

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
  Future<Database> database = openDatabase (
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
    final Database db = await database;
 //stores the map into clothes table
 await db.insert('clothes', 
 clothes.toMap(),
 //conflict algorthm is used incase same clothe appears twice
 conflictAlgorithm: ConflictAlgorithm.replace,
 );

  
//create clothe and add it to Clothes table
  final kitenge = Clothes(
    id: 0,
    name: 'Kitenge',
    price: 100,
  );

  await insertClothes(kitenge);
}
//retrieve list of clothes
Future<List<Clothes>> clothes() async{
  final Database db = await database;

  //query table for all clothes
  final List<Map<String, dynamic>> maps = await db.query('clothes');

//convert list of maps to list of clothes
  return List.generate(maps.length, (i){
    return Clothes(
      id: maps[i]['id'],
      name: maps[i]['name'],
      price: maps[i]['price'],
      );
  });

}
Future<void> updateClothes(Clothes clothes) async{
  final db = await database;
  await db.update('clothes', clothes.toMap(),
  //ensure clothes have matching id
   where:  'id = ?',
   //pass the clothes id as WhereArgs to prevent sql injecton
   whereArgs: [clothes.id],
  );
}


Future<void> deleteClothes(int id) async{
  final db=  await database;

  //remove clothes from DB
  await db.delete('clothes',
  //use where clause to delete a specific clothe
   where:  'id = ?',
   //pass the clothes id as WhereArgs to prevent sql injecton
   whereArgs: [id],
  );
}
//print(await clothes());
}