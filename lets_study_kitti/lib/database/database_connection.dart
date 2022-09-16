import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseConnection{

  setDatabase() async{

    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_review_sqflite');
    var database = await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async{
    await database.execute(
      "CREATE TABLE reviews(reviewID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, subjectCode TEXT NOT NULL, userID BIGINT NOT NULL, lecturer LONGTEXT NULL, subjectType TEXT NOT NULL, period TEXT NOT NULL, teachingQuality REAL NOT NULL, difficulty REAL NOT NULL, interesting REAL NOT NULL, review LONGTEXT NULL, recommended TEXT NOT NULL)");
  }
}