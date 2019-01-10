/**
 * Copyright 2019 (c) The Sayonika Project Authors
 * 
 * Licensed under GNU Affero GPL v3. 
 * You should have recieved a copy of the License with the source code.
 * if not, god be with ye.
 */

import "dart:async" show Future;
import "dart:io";
import "package:flutter/material.dart";
import "package:flutter/foundation.dart"
  show debugDefaultTargetPlatformOverride;
import "package:alcantara/home_view.dart";
import "package:sqflite/sqflite.dart";
import "package:alcantara/utils/db_provider.dart";

// Sets the Target Platform Overrides
// Needed for Dynamic App Behavior for Flutter 
// See: https://github.com/google/flutter-desktop-embedding/blob/master/Flutter-Requirements.md
void _setTargetPlatform()
{
  TargetPlatform targetPlatform;

  if (Platform.isMacOS)
  {
    targetPlatform = TargetPlatform.iOS;
  } 
  else if (Platform.isWindows || Platform.isLinux || Platform.isFuchsia)
  {
    targetPlatform = TargetPlatform.android;
  }

  if (TargetPlatform != null)
  {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

void main()
{
  _initDB();
  _setTargetPlatform();
  runApp(MaterialApp (
    title: "Alcantara by Sayonika",
    home: AlcantaraHomeView()
  ));
}

void _initDB()
{
  var dbPath;
  getDatabasesPath().then((path) => dbPath = path);

  // just to make sure it gets created and doesn't error out when open is called.
  final checkDir = new Directory("$dbPath");

  if(!checkDir.existsSync())
  {
    checkDir.createSync();
  }

  Future open(DBProvider dbProvider) => dbProvider.open("$dbPath/alcantara_data");
  open(DBProvider()).catchError((err) => throw Error());
}