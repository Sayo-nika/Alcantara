/**
 * Copyright 2019 (c) The Sayonika Project Authors
 * 
 * Licensed under GNU Affero GPL v3. 
 * You should have recieved a copy of the License with the source code.
 * if not, god be with ye.
 */

import "package:flutter/material.dart";

class AlcantaraSettingsView extends StatelessWidget
{
  @override
  Widget build(BuildContext context) => Scaffold (
      appBar: AppBar(
        title: const Text("Alcantara Settings"),
        backgroundColor: Colors.red[400],
      ),

      body: Center(
        child: Expanded(
          child: ListView(
            shrinkWrap: true,
            children: const <Widget>[
              Text("Coming soon?"),
              Text("Maybe.")
            ],
          )
        )
      )
    );
}