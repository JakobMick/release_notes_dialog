# Release Notes Dialog

An easy to use release notes dialog.

## Installation

In your pubspec.yaml:

```dart
dependencies:
    release_notes_dialog: "^1.2.0"
```

In your .dart file:

```dart
import 'package:release_notes_dialog/release_notes_dialog.dart';
```

## Basic Usage

Create a list of releases:

```dart
final List<Release> releases = [
    Release(
      "1.1.0",
      [
        ReleaseSublist(
          name: "Features",
          changes: [
            "Added new Feature 1",
            "Added new Feature 2",
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
```

Show the dialog:

```dart
ElevatedButton(
    onPressed: () {
        ReleaseNotesDialog(
            context,
            releases: releases,
        )..show();
    },
    child: Text("Show Dialog"),
);
```

## Customize

### Release Notes Dialog

| Type                | Property                         | Default                        | Description                                                                                                                            |
| ------------------- | -------------------------------- | ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------- |
| Key?                | key                              | NULL                           | Controls how one widget replaces another widget in the tree.                                                                           |
| BuildContext        | context                          | REQUIRED                       | The current build context.                                                                                                             |
| List<Release>       | releases                         | const []                       | The list of releases.                                                                                                                  |
| String              | title                            | 'Release Notes'                | The title of the dialog                                                                                                                |
| String              | closeButtonString                | 'Close'                        | The text on the close button                                                                                                           |
| **Dialog:**         |                                  |                                |                                                                                                                                        |
| double?             | width                            | mediaQuery.size.width \* 0.75  |                                                                                                                                        |
| double?             | height                           | mediaQuery.size.height \* 0.75 |                                                                                                                                        |
| Color?              | backgroundColor                  | NULL                           | The background color of the surface of this Dialog.                                                                                    |
| double?             | elevation                        | NULL                           | The z-coordinate of this Dialog.                                                                                                       |
| ShapeBorder?        | shape                            | NULL                           | The shape of this dialog's border.                                                                                                     |
| bool                | barrierDismissible               | true                           | If the dialog should be dissmissable by tapping on the barrier.                                                                        |
| String?             | semanticLabel                    | NULL                           | The semantic label of the dialog used by accessibility frameworks to announce screen transitions when the dialog is opened and closed. |
| **Content:**        |                                  |                                |                                                                                                                                        |
| EdgeInsetsGeometry? | titlePadding                     | NULL                           | Padding around the title.                                                                                                              |
| EdgeInsetsGeometry? | contentPadding                   | NULL                           | Padding around the content.                                                                                                            |
| double              | paddingBetweenReleases           | 32.5                           | Padding between releases.                                                                                                              |
| double              | paddingBeneathVersionNumber      | 12.5                           | Padding beneath release version numbers.                                                                                               |
| double              | paddingBetweenReleaseSublists    | 10.0                           | Padding beneath release sublists.                                                                                                      |
| double              | paddingBeneathReleaseSublistName | 5.0                            | Padding beneath release sublist names.                                                                                                 |
| double              | paddingBetweenChanges            | 0.0                            | Padding between changes.                                                                                                               |
| TextStyle?          | titleTextStyle                   | NULL                           | Style for the text in the title of this AlertDialog.                                                                                   |
| TextStyle?          | versionNumberTextStyle           | NULL                           | Style for the version numbers.                                                                                                         |
| TextStyle?          | releaseSublistNameTextStyle      | NULL                           | Style for release sublist names.                                                                                                       |
| TextStyle?          | changeTextStyle                  | NULL                           | Style for changes                                                                                                                      |

### Release

| Type                 | Property      | Default  | Description |
| -------------------- | ------------- | -------- | ----------- |
| String               | versionNumber | REQUIRED |             |
| List<ReleaseSublist> | subLists      | REQUIRED |             |

### ReleaseSublist

| Type         | Property | Default   | Description |
| ------------ | -------- | --------- | ----------- |
| String       | name     | 'Changes' |             |
| List<String> | changes  | const []  |             |
