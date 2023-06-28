import 'package:flutter/material.dart';
import 'package:release_notes_dialog/src/release_notes_widget.dart';
import 'package:release_notes_dialog/src/release.dart';

/// Displays a [ReleaseNotesPage], which informs the user about changes to
/// the software.
///
/// The arguments correspond to the properties on [ReleaseNotesPage].
///
/// The `context` argument is used to look up the [Navigator] for the page.
///
/// The `useRootNavigator` argument is used to determine whether to push the
/// page to the [Navigator] furthest from or nearest to the given `context`. It
/// is `false` by default.
void showReleaseNotesPage({
  required BuildContext context,
  required List<Release> releases,
  String? bullet,
  double? bulletSpacing,
  double? releaseSpacing,
  double? releaseTitleSpacing,
  double? changeGroupSpacing,
  double? changeGroupTitleSpacing,
  double? changeSpacing,
  TextStyle? releaseTitleTextStyle,
  TextStyle? changeGroupTitleTextStyle,
  TextStyle? changeTextStyle,
  bool useRootNavigator = false,
}) {
  Navigator.of(context, rootNavigator: useRootNavigator).push(
    MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return ReleaseNotesPage(
          releases: releases,
          bullet: bullet,
          bulletSpacing: bulletSpacing,
          releaseSpacing: releaseSpacing,
          releaseTitleSpacing: releaseTitleSpacing,
          changeGroupSpacing: changeGroupSpacing,
          changeGroupTitleSpacing: changeGroupTitleSpacing,
          changeSpacing: changeSpacing,
          releaseTitleTextStyle: releaseTitleTextStyle,
          changeGroupTitleTextStyle: changeGroupTitleTextStyle,
          changeTextStyle: changeTextStyle,
        );
      },
    ),
  );
}

/// An easy to use and customizable [ReleaseNotesPage].
///
/// A [ReleaseNotesPage] informs the user about changes to the software.
///
/// The arguments correspond to the properties on [ReleaseNotesWidget].
class ReleaseNotesPage extends StatelessWidget {
  /// Creates a [ReleaseNotesPage].
  ///
  /// Only the releases are required. All other arguments are optional.
  const ReleaseNotesPage({
    Key? key,
    required this.releases,
    this.title = 'Release Notes',
    this.bullet,
    this.bulletSpacing,
    this.releaseSpacing,
    this.releaseTitleSpacing,
    this.changeGroupSpacing,
    this.changeGroupTitleSpacing,
    this.changeSpacing,
    this.titleTextStyle,
    this.releaseTitleTextStyle,
    this.changeGroupTitleTextStyle,
    this.changeTextStyle,
  }) : super(key: key);

  /// {@macro rnd.widget.releases}
  final List<Release> releases;

  /// The title of the [ReleaseNotesPage].
  ///
  /// Defaults to 'Release Notes'.
  final String title;

  /// {@macro rnd.widget.bullet}
  final String? bullet;

  /// {@macro rnd.widget.bulletSpacing}
  final double? bulletSpacing;

  /// {@macro rnd.widget.releaseSpacing}
  final double? releaseSpacing;

  /// {@macro rnd.widget.releaseTitleSpacing}
  final double? releaseTitleSpacing;

  /// {@macro rnd.widget.changeGroupSpacing}
  final double? changeGroupSpacing;

  /// {@macro rnd.widget.changeGroupTitleSpacing}
  final double? changeGroupTitleSpacing;

  /// {@macro rnd.widget.changeSpacing}
  final double? changeSpacing;

  /// The [TextStyle] for the dialogs title.
  final TextStyle? titleTextStyle;

  /// {@macro rnd.widget.releaseTitleTextStyle}
  final TextStyle? releaseTitleTextStyle;

  /// {@macro rnd.widget.changeGroupTitleTextStyle}
  final TextStyle? changeGroupTitleTextStyle;

  /// {@macro rnd.widget.changeTextStyle}
  final TextStyle? changeTextStyle;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.loose(const Size.fromWidth(600.0)),
          child: ListView(
            primary: true,
            padding: theme.useMaterial3
                ? const EdgeInsetsDirectional.only(
                    start: 16.0, end: 24.0, top: 8.0)
                : const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
            children: [
              ReleaseNotesWidget(
                releases: releases,
                bullet: bullet,
                bulletSpacing: bulletSpacing,
                releaseSpacing: releaseSpacing,
                releaseTitleSpacing: releaseTitleSpacing,
                changeGroupSpacing: changeGroupSpacing,
                changeGroupTitleSpacing: changeGroupTitleSpacing,
                changeSpacing: changeSpacing,
                releaseTitleTextStyle: releaseTitleTextStyle,
                changeGroupTitleTextStyle: changeGroupTitleTextStyle,
                changeTextStyle: changeTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
