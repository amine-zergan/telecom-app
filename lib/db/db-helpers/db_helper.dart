import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper instance = DbHelper._();

  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await _init();
      return _db!;
    }
  }

  Future<Database> _init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String pathdb = join(dir.path, "telecom.db");
    Database mydb = await openDatabase(pathdb, onCreate: _create, version: 1);

    return mydb;
  }

// ########## create query tables in your database ########
  Future<void> _create(Database db, int version) async {
    await db.execute("""
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  poste TEXT NOT NULL,
  telephone INTEGER,
  image TEXT  
)
""");
    await db.execute("""
CREATE TABLE societies(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT NOT NULL,
  logo TEXT 
)""");
    await db.execute("""
CREATE TABLE sites(
  id INTEGER PRIMARY KEY,
  nom TEXT NOT NULL,
  longitude TEXT NOT NULL,
  latitude TEXT NOT NULL,
  description TEXT,
  maintenancie TEXT,
  contact INTEGER
)
""");
    await db.execute("""
CREATE TABLE projects(
  id INTEGER PRIMARY KEY,
  nom TEXT NOT NULL,
  path TEXT 
)
""");
    await db.execute("""
CREATE TABLE historiques(
  id INTEGER PRIMARY KEY,
  tache TEXT NOT NULL,
  date TEXT
)
""");
    await db.execute("""
CREATE TABLE emploies(
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  post TEXT NOT NULL,
  contact INTEGER
)
""");
    await db.execute("""
CREATE TABLE emploies_missions(
  id INTEGER PRIMARY KEY,
  mission_id INTEGER NOT NULL,
  employ_id INTEGER NOT NULL,
  FOREIGN KEY (mission_id) REFERENCES missions(id),
  FOREIGN KEY (employ_id) REFERENCES emploies(id)
)
""");
    await db.execute("""
CREATE TABLE missions(
  id INTEGER PRIMARY KEY,
  started TEXT NOT NULL,
  finished TEXT,
  bon INTEGER,
  status INTEGER,
  depart REAL,
  arrive REAL,
  car TEXT NOT NULL,
  carburant REAL,
  chef_equipe TEXT NOT NULL,
  chef_projet TEXT,
  paege REAL,
  achat REAL
)
""");
    await db.execute("""
CREATE TABLE tasks(
  id INTEGER PRIMARY KEY,
  projet TEXT NOT NULL,
  url TEXT NOT NULL,
  time TEXT NOT NULL,
  description TEXT NOT NULL,
  location TEXT NOT NULL,
  mission_id INTEGER,
  FOREIGN KEY (mission_id) REFERENCES missions(id)
)
""");

    await db.transaction((txn) async {
      await txn.rawInsert("""
INSERT INTO projects(nom,path) VALUES('nec','assets/NEC.png')
""");
      await txn.rawInsert("""
INSERT INTO projects(nom,path) VALUES('alcatel','assets/alcatel.png')
""");
      await txn.rawInsert("""
INSERT INTO projects(nom,path) VALUES('huawei','assets/huawei.png')
""");
      await txn.rawInsert("""
INSERT INTO projects(nom,path) VALUES('nokia','assets/nokia.png')
""");
      await txn.rawInsert("""
INSERT INTO projects(nom,path) VALUES('orange','assets/orange.png')
""");
      await txn.rawInsert("""
INSERT INTO projects(nom,path) VALUES('ooredoo','assets/ooredoo.png')
""");
      await txn.rawInsert("""
INSERT INTO projects(nom,path) VALUES('telecom','assets/Telecom.png')
""");
    }).then((_) {
      print("values for project add with success");
    });
  }

//############ close database ##############//
  Future close() async {
    final db = await instance.db;
    db.close().then((_) {
      // ignore:
      print("databse closed");
    });
  }
}
