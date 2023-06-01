import 'package:flutter/material.dart';

import 'package:release_notes_dialog/src/release_notes_dialog.dart';
import 'package:release_notes_dialog/src/release.dart';

class ReleaseNotesListTile extends StatelessWidget {
  /// Creates a list tile for showing an about box.
  ///
  /// The arguments are all optional. The application name, if omitted, will be
  /// derived from the nearest [Title] widget. The version, icon, and legalese
  /// values default to the empty string.
  const ReleaseNotesListTile({
    Key? key,
    required this.releases,
    this.title = 'Release Notes',
    this.icon,
    this.bullet = '•',
    this.bulletSpacing,
    this.releaseSpacing,
    this.releaseTitleSpacing,
    this.sublistSpacing,
    this.sublistTitleSpacing,
    this.changeSpacing,
    this.titleTextStyle,
    this.releaseTitleTextStyle,
    this.sublistTitleTextStyle,
    this.changeTextStyle,
    this.dense,
  }) : super(key: key);

  /// {@macro rnd.widget.releases}
  final List<Release> releases;

  /// The title of the [ReleaseNotesListTile].
  ///
  /// Defaults to 'Release Notes'.
  final String title;

  /// The icon to show for this drawer item.
  ///
  /// By default no icon is shown.
  final Widget? icon;

  /// {@macro rnd.widget.bullet}
  final String? bullet;

  /// {@macro rnd.widget.bulletSpacing}
  final double? bulletSpacing;

  /// {@macro rnd.widget.releaseSpacing}
  final double? releaseSpacing;

  /// {@macro rnd.widget.releaseTitleSpacing}
  final double? releaseTitleSpacing;

  /// {@macro rnd.widget.sublistSpacing}
  final double? sublistSpacing;

  /// {@macro rnd.widget.sublistTitleSpacing}
  final double? sublistTitleSpacing;

  /// {@macro rnd.widget.changeSpacing}
  final double? changeSpacing;

  /// The [TextStyle] for the dialogs title.
  final TextStyle? titleTextStyle;

  /// {@macro rnd.widget.releaseTitleTextStyle}
  final TextStyle? releaseTitleTextStyle;

  /// {@macro rnd.widget.sublistTitleTextStyle}
  final TextStyle? sublistTitleTextStyle;

  /// {@macro rnd.widget.changeTextStyle}
  final TextStyle? changeTextStyle;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If this property is null, then its value is based on [ListTileThemeData.dense].
  ///
  /// Dense list tiles default to a smaller height.
  final bool? dense;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    return ListTile(
      leading: icon,
      title: Text(title),
      dense: dense,
      onTap: () {
        showReleaseNotesDialog(
          context: context,
          releases: releases,
          bullet: bullet,
          bulletSpacing: bulletSpacing,
          releaseSpacing: releaseSpacing,
          releaseTitleSpacing: releaseTitleSpacing,
          sublistSpacing: sublistSpacing,
          sublistTitleSpacing: sublistTitleSpacing,
          changeSpacing: changeSpacing,
          releaseTitleTextStyle: releaseTitleTextStyle,
          sublistTitleTextStyle: sublistTitleTextStyle,
          changeTextStyle: changeTextStyle,
        );
      },
    );
  }
}
