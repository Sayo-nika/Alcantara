/**
 * Copyright 2019 (c) The Sayonika Project Authors
 * 
 * Licensed under GNU Affero GPL v3. 
 * You should have recieved a copy of the License with the source code.
 * if not, god be with ye.
 */


import "package:flutter/material.dart";
import "package:alcantara/settings_view.dart";
import "package:alcantara/utils/db_provider.dart";

class AlcantaraHomeView extends StatelessWidget
{

@override
Widget build(BuildContext context) => Scaffold (
    appBar: AppBar (
      backgroundColor: Colors.red[400],
    ),
    body: Center (
      child: Expanded(
        child: ListView(
          children: <Widget>[
            PlaceholderWidget()
          ],
        ),
      )
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

    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
  );
}

class PlaceholderWidget extends StatefulWidget
{
  _PlaceholderWidgetState _placeholderWidget;
  @override
  _PlaceholderWidgetState createState () => _PlaceholderWidgetState(this);

  void onLoad(BuildContext context) => _placeholderWidget.appearOnEmpty();
}

class _PlaceholderWidgetState extends State<PlaceholderWidget>
{
  bool beActive = false;  

  PlaceholderWidget widget;

  _PlaceholderWidgetState(this.widget);

  void appearOnEmpty()
  {
    setState(() async {
         DBProvider db;

         await db.getAllEntries().then(_checkEmpty);
        });
  }

  dynamic _checkEmpty(entries) 
  {
    if (entries.length != 0)
    {
      beActive = false;
    }
    else
    {
      beActive = true;
    }
  }

  @override
  Widget build (BuildContext context) => Center(
      child: Expanded(
        child: ListView(
          children: const <Widget>[
            IconTheme(
              data: IconThemeData(
                color: Color.fromRGBO(128, 128, 128, 65)
              ),
              child: Icon(Icons.wallpaper)
            ),
            Text("We've came up empty! Try adding some mods!")
          ],
        )
      ),
    );
  
  @override
  void initState()
  {
    super.initState();
    widget.onLoad(context);
  }
}