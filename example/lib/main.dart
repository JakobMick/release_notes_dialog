import 'package:flutter/material.dart';

import 'package:release_notes_dialog/release_notes_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  final List<Release> releases = [
  Release(
    "1.1.0",
    [
      ReleaseSublist(
        name: "Features",
        changes: [
          "Added new feature 1",
          "Added new feature 2",
        ],
      ),
      ReleaseSublist(
        name: "Fixes",
        changes: [
          "Fixed bug 1",
          "Fixed bug 2",
          "Fixed bug 3",
        ],
      ),
    ],
  ),
  Release(
    "1.0.0",
    [
      ReleaseSublist(
        name: "Release!",
      ),
    ],
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Release notes dialog example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ReleaseNotesDialog(
              context,
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              releases: releases,
            )..show();
          },
          child: Text("Show Dialog"),
        ),
      ),
    );
  }
}
