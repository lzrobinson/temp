import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ReviewDb{

  setDatabase() async{

    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_review_sqflite');
    var database = await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async{
    await database.execute(
      "CREATE TABLE reviews(ReviewID INTEGER PRIMARY KEY, SubjectCode INTEGER, UserID INTEGER, Lecturer TEXT, Compulsory INTEGER, ExamWeightage INTEGER, Period TEXT, TeachingQuality INTEGER, Difficulty INTEGER, Interesting INTEGER, Review TEXT, Recommended INTEGER)");
  }
}