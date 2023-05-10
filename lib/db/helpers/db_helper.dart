import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:telecom/db/helpers/constant_db.dart';

class DbHelper {
  DbHelper._();
  static DbHelper instance = DbHelper._();

  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      // ignore: avoid_print
      print("=======Database initialise for used ===========");
      return _db!;
    } else {
      _db = await _init();
      return _db!;
    }
  }

  Future<Database> _init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String pathdb = join(dir.path, "telecom.db");
    Database mydb = await openDatabase(
      pathdb,
      onCreate: _create,
      version: 1,
      onConfigure: _onConfigure,
    );
    // ignore: avoid_print
    print("=======Database ready for used ===========");
    return mydb;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  /// create query tables in your database
  Future<void> _create(Database db, int version) async {
    await db.execute("""
CREATE TABLE $historiques(
  $id INTEGER PRIMARY KEY,
  $task TEXT NOT NULL,
  $detail TEXT ,
  $date INTEGER
)
""");

    /// Table for Operator Mobile in App
    /// inject query in db for operator with logo in assest file
    await db.execute("""
CREATE TABLE $operators(
  $id INTEGER PRIMARY KEY,
  $name TEXT NOT NULL,
  $image TEXT 
)""");

    /// Table for Project Mobile in App
    /// inject query in db for project with logo in assest file:huawei , nokia, Nec ....
    await db.execute("""
CREATE TABLE $projects(
  $id INTEGER PRIMARY KEY,
  $name TEXT NOT NULL,
  $image TEXT 
)""");

    /// Table for Equipements Mobile in App
    await db.execute("""
CREATE TABLE $equipements(
  $id INTEGER PRIMARY KEY,
  $name TEXT NOT NULL,
  $type TEXT ,
  $description TEXT,
  $ref TEXT NOT NULL,
  $project INTEGER NOT NULL,
  FOREIGN KEY (project) REFERENCES projects(id)
)""");

    /// Table for Sites Mobile in App Done
    await db.execute("""
CREATE TABLE $site(
  $id INTEGER PRIMARY KEY,
  $name TEXT NOT NULL,
  $operator INTEGER NOT NULL,
  $latitude TEXT NOT NULL,
  $longitude TEXT NOT NULL,
  $description TEXT,
  $responsable TEXT,
  $phone TEXT,
  FOREIGN KEY (operator) REFERENCES operators(id)
)
""");

    /// Table for Entreprises Mobile in App Ok
    await db.execute("""
CREATE TABLE $entreprises(
  $id INTEGER PRIMARY KEY,
  $name TEXT NOT NULL,
  $taille TEXT ,
  $address TEXT NOT NULL ,
  $codepostal TEXT,
  $phone TEXT,
  $fixe TEXt,
  $logo TEXT
)
""");

    /// Table for Contact Mobile in App Ok
    await db.execute("""
CREATE TABLE $contacts(
  $id INTEGER PRIMARY KEY,
  $name TEXT NOT NULL,
  $post TEXT NOT NULL,
  $contact TEXT
)
""");

    /// Table for Profile Mobile in App Ok
    await db.execute("""
CREATE TABLE $profile(
  $id INTEGER PRIMARY KEY,
  $name TEXT NOT NULL,
  $address TEXT ,
  $codePoste TEXT ,
  $post TEXT,
  $phone TEXT,
  $salaire TEXT,
  $niveau TEXT,
  $contract TEXT,
  $creatAt INTEGER,
  $image TEXT
)
""");

    await db.execute("""
CREATE TABLE $missions(
  $id INTEGER PRIMARY KEY,
  $started TEXT NOT NULL,
  $finished TEXT,
  $deplacement INTEGER,
  $equipe INTEGER,
  $bon INTEGER,
  $status INTEGER,
  $depart REAL ,
  $arrive REAL,
  $car TEXT NOT NULL,
  $carburant REAL,
  $chefequipe TEXT NOT NULL,
  $chefprojet TEXT,
  $peage REAL,
  $achat REAL
)
""");
    await db.execute("""
CREATE TABLE $tasks(
  $id INTEGER PRIMARY KEY,
  $project int NOT NULL,
  $date TEXT NOT NULL,
  region TEXT NOT NULL,
  $description TEXT NOT NULL,
  $mission INTEGER,
  $operator INTEGER,
  FOREIGN KEY (operator) REFERENCES operators(id),
  FOREIGN KEY (project) REFERENCES projects(id),
  FOREIGN KEY (mission) REFERENCES missions(id)
)
""");
// ignore: avoid_print
    print("=======Database created with succes   ===========");

    await db.transaction((txn) async {
      await txn.rawInsert("""
INSERT INTO operators(name,image) VALUES('Ooredoo','assets/project/ooredoo.png')
""");
      await txn.rawInsert("""
INSERT INTO operators(name,image) VALUES('Orange','assets/project/orange.png')
""");
      await txn.rawInsert("""
INSERT INTO operators(name,image) VALUES('Telecom','assets/project/telecom.png')
""");
      await txn.rawInsert("""
INSERT INTO projects(name,image) VALUES('Nokia','assets/project/nokia.png')
""");
      await txn.rawInsert("""
INSERT INTO projects(name,image) VALUES('Nec','assets/project/nec.png')
""");
      await txn.rawInsert("""
INSERT INTO projects(name,image) VALUES('Alcatel','assets/project/alcatel.png')
""");
      await txn.rawInsert("""
INSERT INTO projects(name,image) VALUES('Huawei','assets/project/huawei.png')
""");
    }).then((_) {
      // ignore: avoid_print
      print("values for project add with success");
    });
  }

  /// close database
  Future close() async {
    final db = await instance.db;
    db.close().then((_) {
      // ignore:, avoid_print
      print("===== database was cloased with succcess =======");
    });
  }
}
