import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
  show debugDefaultTargetPlatformOverride;
import 'package:alcantara/home_view.dart';

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
  _setTargetPlatform();
  runApp(MaterialApp(
    title: "Alcantara by Sayonika",
    home: AlcantaraHomeView()
  ));
}