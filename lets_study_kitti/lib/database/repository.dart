import 'package:lets_study_kitti/database/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Respository{

  late DatabaseConnection databaseConnection;

  Respository(){

    //Initialize db connection
    databaseConnection = DatabaseConnection();
  }

  static late Database _database;

  Future<Database> get database async{

    if (_database != null) return _database;
    _database = await databaseConnection.setDatabase();
    return _database;
  }

  //Insert data into table
  insertData(table, data) async{

    var connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async{

    var connection = await database;
    return await connection.query(table);
  }

}