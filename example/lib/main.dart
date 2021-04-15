import 'dart:io';

import 'package:flutter/material.dart';

import 'package:release_notes_dialog/release_notes_dialog.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Release Notes Dialog Example',
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
            if (Platform.isAndroid) "Fixed bug on Android",
            if (Platform.isIOS) "Fixed bug on iOS",
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
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return ReleaseNotesDialog(releases: releases);
              }),
          child: Text("Show Dialog"),
        ),
      ),
    );
  }
}
