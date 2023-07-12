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
      title: 'ReleaseNotesDialog Example',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  final List<Release> releases = [
    Release(
      title: "1.1.0",
      changes: [
        ChangeGroup(
          title: "Features",
          changes: [
            "Added new feature 1",
            "Added new feature 2",
            "Added a very long feature to show how multiple lines work",
          ],
        ),
        ChangeGroup(
          title: "Fixes",
          changes: [
            if (Platform.isAndroid) "Fixed bug on Android",
            if (Platform.isIOS) "Fixed bug on iOS",
            "Fixed a very long bug to show multiple lines again",
            "Fixed bug 1",
            "Fixed bug 2",
            "Fixed bug 3",
          ],
        ),
      ],
    ),
    Release(
      title: "1.0.0",
      changes: [ChangeGroup(title: "Release!")],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('ReleaseNotesDialog Example'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "Dialogs",
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ReleaseNotesDialog(releases: releases);
                    }),
                child: Text("Show ReleaseNotesDialog"),
              ),
              ElevatedButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AboutDialog(
                        applicationVersion: releases.first.title,
                      );
                    }),
                child: Text("Show AboutDialog"),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 15),
            child: Text(
              "Pages",
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => showReleaseNotesPage(
                  context: context,
                  releases: releases,
                ),
                child: Text("Show ReleaseNotesPage"),
              ),
              ElevatedButton(
                onPressed: () => showLicensePage(
                  context: context,
                  applicationVersion: releases.first.title,
                ),
                child: Text("Show LicensePage"),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 15),
            child: Text(
              "ListTiles",
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          ReleaseNotesListTile(releases: releases),
          AboutListTile(),
        ],
      ),
    );
  }
}
