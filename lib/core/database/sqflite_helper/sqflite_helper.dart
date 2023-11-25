import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';

class SqfliteHelper {
  late Database db;
  // 1. Create a new database
  // 2. Create a new Table
  // 3. CRUD => Create - read - Update - Delete

  //! initialize Database
  void initDB() async {
    // step 1 => Create DataBase
    await openDatabase('tasks.db',
            version: 1,
            onCreate: (Database db, int v) async {
              // step 2 => Create Table
              await db.execute('''
          CREATE TABLE Tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            notes TEXT,
            date TEXT,
            startTime TEXT,
            endTime TEXT,
            color INTEGER,
            isComplete INTEGER )
          ''').then((value) => print('DataBase Created Successfully'));
            },
            onOpen: (db) => print('DataBase Opened Successfully'))
        .then((value) => db = value)
        .catchError((e) {
      print(e.toString());
    });
  }

  //! Get DataBase
  Future<List<Map<String, Object?>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM Tasks');
  }

  //! Insert DataBase
  Future<int> insertToDB(TaskModel model) async {
    return await db.rawInsert('''INSERT INTO Tasks (
      title , note , date , startTime, endTime, color , isCompleted) 
      VALUES 
      (${model.title} , ${model.note} , ${model.date} , ${model.startTime} , 
      ${model.endTime} , ${model.color} , ${model.isCompleted} )''');
  }

  //! Update DataBase
  Future<int> updateDB(int id) async {
    return await db.rawUpdate(
      '''
      UPDATE Tasks
      SET isCompleted = ?
      WHERE id = ?
      ''',
      [1, id],
    );
  }

  //! Delete DataBase
  Future<int> deleteFromDB(int id) async {
    return await db.rawDelete(
      '''DELETE FROM Tasks WHERE id = ?''',
      [id],
    );
  }
}
