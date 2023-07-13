# Release Notes Dialog

An easy to use release notes dialog. Customizable to fit your apps design.

<img src="https://github.com/JakobMick/release_notes_dialog/blob/main/README_example_screenshot.jpg?raw=true" width="256">

This package is ment to complement the existing [AboutDialog](https://api.flutter.dev/flutter/material/AboutDialog-class.html).

## Installation

In your pubspec.yaml:

```dart
dependencies:
    release_notes_dialog: "^2.0.0"
```

In your .dart file:

```dart
import 'package:release_notes_dialog/release_notes_dialog.dart';
```

## Basic Usage

The ```ReleaseNotesDialog``` requires a list of ```Release```s. A ```Release``` requires a title and contains a list of ```ChangeGroup```s. ```ChangeGroup```s are used to group your changes, for example features, bug fixes, improvements and more.

Create a list of releases:

```dart
final List<Release> releases = [
  Release(
    title: "1.1.0",
    changes: [
      ChangeGroup(
        title: "Features",
        changes: [
          "Added a new feature",
          "Added a second feature",
        ],
      ),
      ChangeGroup(
        title: "Fixes",
        changes: [
          "Fixed the first bug",
          "Fixed a happy little accident",
          "Fixed another bug",
        ],
      ),
    ],
  ),
  Release(
    title: "1.0.0",
    changes: [
      ChangeGroup(
        title: "Release!",
      ),
    ],
  ),
];
```

You can display your releases in a variety of ways:

- Show the ```ReleaseNotesDialog``` using the ```showDialog()``` function:

  ```dart
  ElevatedButton(
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return ReleaseNotesDialog(releases: releases);
          }),
      child: Text("Show ReleaseNotesDialog"),
  );
  ```

- Show the dialog using the ```showReleaseNotesDialog()``` function:

  ```dart
  ElevatedButton(
      onPressed: () => showReleaseNotesDialog(
          context: context,
          releases: releases,
      ),
      child: Text("Show ReleaseNotesDialog"),
  );
  ```

- Show the ```ReleaseNotesPage``` using the ```Navigator```:

  ```dart
  ElevatedButton(
      onPressed: () => Navigator.of(context, rootNavigator: useRootNavigator).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return ReleaseNotesPage(
              releases: releases,
            );
          },
        ),
      ),
      child: Text("Show ReleaseNotesPage"),
  );
  ```

- Show the page using the ```showReleaseNotesPage()``` function:

  ```dart
  ElevatedButton(
      onPressed: () => showReleaseNotesPage(
          context: context,
          releases: releases,
      ),
      child: Text("Show ReleaseNotesPage"),
  );
  ```

- Show the ```ReleaseNotesListTile```:

  ```dart
  ReleaseNotesListTile(releases: releases);
  ```

- Show the ```ReleaseNotesWidget```:

  ```dart
  ReleaseNotesWidget(releases: releases);
  ```

## Contributions

Contributions, feature requests and bug reports are welcomed!
