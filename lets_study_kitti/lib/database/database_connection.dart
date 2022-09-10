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
      "CREATE TABLE reviews(reviewID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, subjectCode TEXT NOT NULL, userID BIGINT NOT NULL, lecturer LONGTEXT NULL, compulsory TINYINT NOT NULL, examWeightage INT NOT NULL, period TEXT NOT NULL, teachingQuality INT NOT NULL, difficulty INT NOT NULL, interesting INT NOT NULL, review LONGTEXT NULL, recommended TEXT NOT NULL)");
  }
}