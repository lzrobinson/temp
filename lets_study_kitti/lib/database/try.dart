import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:lets_study_kitti/database/Review.dart';

class DBProvider{

  DBProvider._();
  static final DBProvider db = DBProvider._();
  static late Database _database;

  Future<Database> get database async {

    if (_database != null)
    return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async{

    return await openDatabase(
      join(await getDatabasesPath(), 'review.db'),
      onCreate: (db, version) async{
        await db.execute('''
        "CREATE TABLE reviews(
          reviewID BIGINT NOT NULL PRIMARY KEY, 
          subjectCode TEXT NOT NULL, 
          userID BIGINT NOT NULL, 
          lecturer LONGTEXT NULL, 
          subjectType TEXT NOT NULL, 
          period TEXT NOT NULL, 
          teachingQuality REAL NOT NULL, 
          difficulty REAL NOT NULL, 
          interesting REAL NOT NULL, 
          review LONGTEXT NULL, 
          recommended TEXT NOT NULL)''');
      }, 
      version: 1
    );
  }

  newReview(newReview) async {

    final db = await database;

    var res = await db.rawInsert('''
        INSERT INTO reviews(
          reviewID, subjectCode, userID, lecturer, subjectType,
          period, teachingQuality, difficulty, interesting, 
          review, recommended
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
          ''', [newReview.reviewID, newReview.subjectCode,
          newReview.userID, newReview.lecturer, newReview.subjectType,
          newReview.period, newReview.teachingQuality, newReview.difficulty,
          newReview.interesting, newReview.review, newReview.recommended]
        );
      
      return res;
  }

}