import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // 单例 DatabaseHelper
  static Database _database; // 单例 Database

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colColor = 'color';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // 初始化

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); 
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  // 数据库储存路径
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/notes.db';
    print('path');
    print(path);
    // 打开数据库
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  // 创建表
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDescription TEXT, $colPriority INTEGER, $colColor INTEGER,$colDate TEXT)');
  }

  // 取数据
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');

    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  // 插入对象
  Future<int> insertNote(T) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, T.toMap());
    return result;
  }

  // 更新对象
  Future<int> updateNote(T) async {
    var db = await this.database;
    var result = await db.update(noteTable, T.toMap(),
        where: '$colId = ?', whereArgs: [T.id]);
    return result;
  }

  // 删除对象
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  // 个数
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // 返回数组
  // Future<List<E>> getNoteList() async {
  //   var noteMapList = await getNoteMapList(); // Get 'Map List' from database
  //   int count =
  //       noteMapList.length; // Count the number of map entries in db table

  //   List<T> noteList = List<T>();
  //   // For loop to create a 'Note List' from a 'Map List'
  //   for (int i = 0; i < count; i++) {
  //     noteList.add(T.fromMapObject(noteMapList[i]));
  //   }

  //   return noteList;
  // }
}
