/**
 * Copyright 2019 (c) The Sayonika Project Authors
 * 
 * Licensed under GNU Affero GPL v3. 
 * You should have recieved a copy of the License with the source code.
 * if not, god be with ye.
 */
import "dart:async";
import "package:sqflite/sqflite.dart";

// table names for shit
final modsTable = "mods";
final columnTitle = "title";
final columnSyAuthor = "sayonika_author";
final columnSyModId = "sayonika_id";
final columnSyURL = "sayonika_mod_url";
final columnInstalledPath = "installed_path";
final columnID = "_id";


// LocalMod Model
class LocalModEntry 
{
  String title;
  int id;
  String path;
  String sayonikaAuthor;
  String sayonikaModID;

  Map<String, dynamic> toMap()
  {
    final map = <String, dynamic> {
      columnID: id,
      columnTitle: title,
      columnInstalledPath: path,
      columnSyAuthor: sayonikaAuthor != null ? sayonikaAuthor: null,
      columnSyModId: sayonikaAuthor != null ? sayonikaModID: null
    };
    if (title != null)
    {
      map[columnTitle] = title;
    }
    return map;
  }

  LocalModEntry();

  LocalModEntry.fromMap(Map<String, dynamic> map)
  {
    id = map[columnID];
    title = map[columnTitle];
    path = map[columnInstalledPath];
    sayonikaAuthor = map[columnSyAuthor];
    sayonikaModID = map[columnSyModId];
  }
}


class DBProvider 
{
  Database db;

  Future open(String path) async =>
    db = await openDatabase(path, version: 1,
        onCreate: (db, version) async {
      await db.execute('''
          create table $modsTable ( 
          $columnID integer primary key autoincrement
          $columnSyAuthor text, 
          $columnTitle text not null,
          $columnInstalledPath text not null
          $columnSyAuthor text
          $columnSyModId text)
      ''');
  });

  Future<LocalModEntry> insert(LocalModEntry entry) async
  {
    entry.id = await db.insert(modsTable, entry.toMap());
    return entry;
  }

  Future<LocalModEntry> getEntry(String title) async 
  {
    final List<Map> maps = await db.query(modsTable,
        columns: [columnInstalledPath, columnSyAuthor,columnSyModId, columnTitle],
        where: '$columnTitle = ?',
        whereArgs: [title]);
    if (maps.isNotEmpty) 
    {
      return LocalModEntry.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Map<String,dynamic>>> getAllEntries() async
  {
    final List<Map<String, dynamic>> records = await db.query(modsTable);
    return records;
  }

  Future<int> delete(String title) async =>
    db.delete(modsTable, where: '$columnTitle = ?', whereArgs: [title]);

  Future<int> update(LocalModEntry localModEntry) async =>
    db.update(modsTable, localModEntry.toMap(),
        where: '$columnTitle = ?', whereArgs: [localModEntry.title]);

  Future close() async => db.close();
}