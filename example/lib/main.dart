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
      "1.2.0",
      [
        ReleaseSublist(
          name: "Features",
          changes: [
            "Added app shortcuts",
            "Added new calculator tab: Unit converter",
          ],
        ),
        ReleaseSublist(
          name: "Improvements",
          changes: [
            "Added adaptive icon",
          ],
        ),
        ReleaseSublist(
          name: "Fixes",
          changes: [
            "Fixed date format on entry screen",
            "Fixed bug when deleting only entry from movement",
          ],
        ),
        ReleaseSublist(
          name: "Other",
          changes: [
            "Removed third party ads",
          ],
        ),
      ],
    ),
    Release(
      "1.1.0",
      [
        ReleaseSublist(
          name: "Features",
          changes: [
            "Added highlighting search terms",
          ],
        ),
        ReleaseSublist(
          name: "Improvements",
          changes: [
            "Improved offline capabilities",
            "Improved error handling",
            "Improved database reads and writes",
            "Other minor improvements",
          ],
        ),
        ReleaseSublist(
          name: "Fixes",
          changes: [
            "Fixed bug where ads would not be disposed correcty",
            "Fixed bug that would appear after deleting an entry",
            "Other minor bug fixes",
          ],
        ),
        ReleaseSublist(
          name: "Other",
          changes: [
            "Full Android 11 support",
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
