/**
 * Copyright 2019 (c) The Sayonika Project Authors
 * 
 * Licensed under GNU Affero GPL v3. 
 * You should have recieved a copy of the License with the source code.
 * if not, god be with ye.
 */

import "dart:async";
import "package:alcantara/utils/db_provider.dart";
import "package:flutter/foundation.dart";

class Mod
{
  Mod(this.title, this.installedPath, this.sayonikaModAuthor, this.sayonikaModID);

  String title;
  String installedPath;
  String sayonikaModAuthor;
  String sayonikaModID;
}

class ModData extends ChangeNotifier
{
  ModData()
  {
    DBProvider db;
    
    db.getAllEntries().then(_returnData);
  }
}

void _returnData(records)
{
  //TODO(sr229): Return data from DB as a card!
}