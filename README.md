# Release Notes Dialog

An easy to use release notes dialog. Customizable to fit your apps design.

<img src="https://github.com/JakobMick/release_notes_dialog/blob/main/README_example_screenshot.jpg?raw=true" width="256">

## Installation

In your pubspec.yaml:

```dart
dependencies:
    release_notes_dialog: "^1.0.3"
```

In your .dart file:

```dart
import 'package:release_notes_dialog/release_notes_dialog.dart';
```

## Basic Usage

The ReleaseNotesDialog requires a list of releases. A release needs a version number and contains a list of sublists. Sublists are used to group your changes, for example features, bug fixes, improvements, other.

Create a list of releases:

```dart
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

## API

### Release Notes Dialog

| Type                | Property                         | Default                        | Description                                                                                                                            |
| ------------------- | -------------------------------- | ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------- |
| Key?                | key                              | NULL                           | Controls how one widget replaces another widget in the tree.                                                                           |
| BuildContext        | context                          | REQUIRED                       | The current build context.                                                                                                             |
| List<Release>       | releases                         | const [ ]                      | The list of releases.                                                                                                                  |
| String              | title                            | 'Release Notes'                | The title of the dialog                                                                                                                |
| String              | closeButtonString                | 'Close'                        | The text on the close button                                                                                                           |
| **Dialog:**         |                                  |                                |                                                                                                                                        |
| double?             | width                            | mediaQuery.size.width \* 0.75  | The width of the dialog.                                                                                                               |
| double?             | height                           | mediaQuery.size.height \* 0.75 | The height of the dialog.                                                                                                              |
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

| Type                 | Property      | Default  | Description                         |
| -------------------- | ------------- | -------- | ----------------------------------- |
| String               | versionNumber | REQUIRED | The version number of this release. |
| List<ReleaseSublist> | subLists      | REQUIRED | The sublists of this release.       |

### ReleaseSublist

| Type         | Property | Default   | Description                         |
| ------------ | -------- | --------- | ----------------------------------- |
| String       | name     | 'Changes' | The name of this sublist.           |
| List<String> | changes  | const [ ] | The list of changes of this sublist |

## Contributions

Contributions, feature requests and bug reports are welcomed!
