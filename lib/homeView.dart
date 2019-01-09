/**
 * Copyright 2019 (c) The Sayonika Project Authors
 * 
 * Licensed under GNU Affero GPL v3. You should have recieved a copy of the License with the source code.
 * if not, god be with ye.
 */


import 'package:flutter/material.dart';
import 'package:alcantara/settingsView.dart';

class AlcantaraHomeView extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
      ),
      body: Center(
        child: Text("Work In Progress!")
      ),

      drawer: Drawer(
        elevation: 3,
        child: ListView(
           padding: EdgeInsets.zero,
           children: <Widget>[
             DrawerHeader(
               child: Text("Alcantara Pre-Alpha"),
               decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage("bg/s1.png"))
               )
             ),
             ListTile(
               title: Text("Settings"),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => AlcantaraSettingsView()));
               },
             )
           ]
         )
        ),

      floatingActionButton: FloatingActionButton(
        // do nothing, prototype design for now!
        // Plus the fact I'm the only one doing it
        // so this is probably gonna be forgotten again >////<
        onPressed: null,
        tooltip: "Add Mod",
        child: Icon(Icons.add)
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}