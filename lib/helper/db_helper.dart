import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sticky_notes/model/notes.dart';

class DbHelper {
  DbHelper._();
  static final dbHelper = DbHelper._();
  Database database;

  static final String dbName = 'noteDB.db';
  static final String tableName = 'notes';
  static final String columnId = 'id';
  static final String columnTitle = 'title';
  static final String columnContain = 'contain';
  static final String columnDate = 'date';

  intDatabase() async {
    database = await getDatabaseConnection();
  }

  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$dbName';
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, v) {
        db.execute(
            '''CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnTitle TEXT,$columnContain TEXT,$columnDate Text)''');
      },
      onOpen: (db) => print('DB is opened'),
    );

    return database;
  }

  insertNote(Notes notes) async {
    int numRaw = await database.insert(tableName, notes.toMap());
    print(numRaw);
  }

  Future<List<Notes>> getAllNotes() async {
    List<Map<String, Object>> results = await database.query(tableName);
    List<Notes> notes = results.map((e) {
      return Notes.fromMap(e);
    }).toList();
    return notes;
  }

  // Future<int> numAllNotes() async {
  //   List<Map<String, Object>> results = await database.query(tableName);
  //   return results.length;
  // }

  // Future<Notes> getspecifiedNote(int id) async {
  //   List<Map<String, dynamic>> results =
  //       await database.query(tableName, where: 'id=?', whereArgs: [id]);
  //   Notes note = Notes.fromMap(results.first);
  //   return note;
  // }

  deleteNote(int id) async {
    await database.delete(tableName, where: 'id=?', whereArgs: [id]);
  }

  updateNote(Notes note) async {
    await database
        .update(tableName, note.toMap(), where: 'id=?', whereArgs: [note.id]);
  }
}
