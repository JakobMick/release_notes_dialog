import 'package:flutter/material.dart';

import 'package:release_notes_dialog/src/change_group.dart';
import 'package:release_notes_dialog/src/release.dart';

const String _defaultBullet = "•";
const double _defaultBulletSpacing = 2.5;
const double _defaultReleaseSpacing = 12.5;
const double _defaultReleaseTitleSpacing = 12.5;
const double _defaultChangeGroupSpacing = 10.0;
const double _defaultChangeGroupTitleSpacing = 5.0;
const double _defaultChangeSpacing = 0.0;

bool _isNullOrEmpty(List<dynamic>? list) {
  if (list == null || list.isEmpty) {
    return true;
  }

  return false;
}

/// An easy to use and customizable [ReleaseNotesWidget].
///
/// A [ReleaseNotesWidget] informs the user about changes to the software.
///
/// This widget is used internally for [ReleaseNotesDialog],
/// [ReleaseNotesPage], and [ReleaseNotesListTile].
class ReleaseNotesWidget extends StatelessWidget {
  /// Creates a [ReleaseNotesWidget].
  ///
  /// Only the releases are required. All other arguments are optional.
  ///
  /// Typically [ReleaseNotesDialog], [ReleaseNotesPage], [ReleaseNotesListTile],
  /// or their corresponding functions are being used instead.
  ReleaseNotesWidget({
    Key? key,
    required this.releases,
    this.bullet,
    this.bulletSpacing,
    this.releaseSpacing,
    this.releaseTitleSpacing,
    this.changeGroupSpacing,
    this.changeGroupTitleSpacing,
    this.changeSpacing,
    this.releaseTitleTextStyle,
    this.changeGroupTitleTextStyle,
    this.changeTextStyle,
  }) : super(key: key);

  /// {@template rnd.widget.releases}
  /// The [Release]s of your software.
  /// {@endtemplate}
  final List<Release> releases;

  /// {@template rnd.widget.bullet}
  /// The bullet used in the [ReleaseNotesWidget].
  ///
  /// Defaults to '•'.
  /// {@endtemplate}
  final String? bullet;

  /// {@template rnd.widget.bulletSpacing}
  /// The spacing behind the bullets.
  ///
  /// Defaults to 2.5.
  /// {@endtemplate}
  final double? bulletSpacing;

  /// {@template rnd.widget.releaseSpacing}
  /// The spacing between the different [Release]s.
  ///
  /// Defaults to 12.5.
  /// {@endtemplate}
  final double? releaseSpacing;

  /// {@template rnd.widget.releaseTitleSpacing}
  /// The spacing beneath the version number of each [Release].
  ///
  /// Defaults to 12.5.
  /// {@endtemplate}
  final double? releaseTitleSpacing;

  /// {@template rnd.widget.changeGroupSpacing}
  /// The spacing between the [ChangeGroup]s of each [Release].
  ///
  /// Defaults to 10.0.
  /// {@endtemplate}
  final double? changeGroupSpacing;

  /// {@template rnd.widget.changeGroupTitleSpacing}
  /// The spacing beneath the name of each [ChangeGroup].
  ///
  /// Defaults to 5.0.
  /// {@endtemplate}
  final double? changeGroupTitleSpacing;

  /// {@template rnd.widget.changeSpacing}
  /// The spacing between the single changes in each [ChangeGroup].
  ///
  /// Defaults to 0.0.
  /// {@endtemplate}
  final double? changeSpacing;

  /// {@template rnd.widget.releaseTitleTextStyle}
  /// The [TextStyle] for the [Release]s title.
  ///
  /// Defaults to [TextTheme.titleMedium] of [ThemeData.textTheme].
  /// {@endtemplate}
  final TextStyle? releaseTitleTextStyle;

  /// {@template rnd.widget.changeGroupTitleTextStyle}
  /// The [TextStyle] for the [ChangeGroup]s title.
  ///
  /// Defaults to [TextTheme.titleSmall] of [ThemeData.textTheme].
  /// {@endtemplate}
  final TextStyle? changeGroupTitleTextStyle;

  /// {@template rnd.widget.changeTextStyle}
  /// The [TextStyle] for the each change.
  ///
  /// Defaults to [TextTheme.bodyMedium] of [ThemeData.textTheme].
  /// {@endtemplate}
  final TextStyle? changeTextStyle;

  Widget _getReleases(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final TextStyle? finalVersionNumberTextStyle = releaseTitleTextStyle ??
        theme.textTheme.titleMedium?.copyWith(height: 1);

    final TextStyle? finalChangeGroupNameTextStyle =
        changeGroupTitleTextStyle ??
            theme.textTheme.titleSmall?.copyWith(height: 1);

    final TextStyle? finalChangeTextStyle =
        changeTextStyle ?? theme.textTheme.bodyMedium;

    List<Widget> _getChanges(ChangeGroup changeGroup) {
      List<Widget> widgets = [];

      for (int i = 0; i < changeGroup.changes.length; i++) {
        widgets.add(Row(
          mainAxisSize: MainAxisSize.min,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              changeGroup.bullet ?? this.bullet ?? _defaultBullet,
              style: finalChangeTextStyle,
            ),
            SizedBox(
              width: changeGroup.bulletSpacing ??
                  this.bulletSpacing ??
                  _defaultBulletSpacing,
            ),
            Expanded(
              child: Text(
                changeGroup.changes[i],
                style: finalChangeTextStyle,
              ),
            ),
          ],
        ));

        if (i < changeGroup.changes.length - 1)
          widgets.add(SizedBox(
            height: changeSpacing ?? _defaultChangeSpacing,
          ));
      }

      return widgets;
    }

    List<Widget> _getChangeGroups(Release release) {
      List<Widget> widgets = [];

      if (_isNullOrEmpty(release.changes)) {
        return [];
      }

      for (int i = 0; i < release.changes!.length; i++) {
        widgets.addAll([
          Padding(
            padding: EdgeInsets.only(
                bottom: release.changes![i].changes.isNotEmpty
                    ? (changeGroupTitleSpacing ??
                        _defaultChangeGroupTitleSpacing)
                    : 0),
            child: Text(
              release.changes![i].title,
              style: finalChangeGroupNameTextStyle,
            ),
          ),
          ..._getChanges(release.changes![i])
        ]);

        if (i < release.changes!.length - 1)
          widgets.add(SizedBox(
            height: changeGroupSpacing ?? _defaultChangeGroupSpacing,
          ));
      }

      return widgets;
    }

    List<Widget> widgets = [];

    for (int i = 0; i < releases.length; i++) {
      widgets.addAll([
        Padding(
          padding: EdgeInsets.only(
            bottom: !_isNullOrEmpty(releases[i].changes)
                ? (releaseTitleSpacing ?? _defaultReleaseTitleSpacing)
                : 0,
          ),
          child: Text(
            releases[i].title,
            style: finalVersionNumberTextStyle,
          ),
        ),
        ..._getChangeGroups(releases[i])
      ]);

      if (i < releases.length - 1)
        widgets.add(SizedBox(
          height: releaseSpacing ?? _defaultReleaseSpacing,
        ));
    }

    return ListBody(
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: _getReleases,
    );
  }
}
