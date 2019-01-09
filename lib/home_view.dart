/**
 * Copyright 2019 (c) The Sayonika Project Authors
 * 
 * Licensed under GNU Affero GPL v3. 
 * You should have recieved a copy of the License with the source code.
 * if not, god be with ye.
 */


import "package:flutter/material.dart";
import "package:alcantara/settings_view.dart";

class AlcantaraHomeView extends StatefulWidget
{
  AlcantaraHomeState createState() => AlcantaraHomeState(); 
}

class AlcantaraHomeState extends State<AlcantaraHomeView>
{
  // TODO(sr229): dynamically populate with cards from DB.
}

@override
Widget build(BuildContext context) => Scaffold (
    appBar: AppBar (
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
    ),
    body: Center (
      child: const Text("Work In Progress!")
    ),

    drawer: Drawer(
      elevation: 3,
      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader (
              child: const Text("Alcantara Pre-Alpha"),
              decoration: BoxDecoration(
                image: DecorationImage(image: const AssetImage("bg/s1.png"))
              )
            ),
            ListTile (
              title: const Text("Settings"),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => AlcantaraSettingsView()));
              },
            )
          ]
        )
      ),

    floatingActionButton: FloatingActionButton (
      // do nothing, prototype design for now!
      // Plus the fact I"m the only one doing it
      // so this is probably gonna be forgotten again >////<
      onPressed: null,
      tooltip: "Add Mod",
      child: const Icon(Icons.add)
    ),

    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );