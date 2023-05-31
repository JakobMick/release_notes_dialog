import 'package:flutter/material.dart';

import 'package:release_notes_dialog/src/release_sublist.dart';
import 'package:release_notes_dialog/src/release.dart';

class ReleaseNotesWidget extends StatelessWidget {
  const ReleaseNotesWidget({
    Key? key,
    required this.releases,
    this.bullet = '•',
    this.bulletPadding = 2.5,
    this.paddingBetweenReleases = 32.5,
    this.paddingBeneathVersionNumber = 12.5,
    this.paddingBetweenReleaseSublists = 10.0,
    this.paddingBeneathReleaseSublistName = 5.0,
    this.paddingBetweenChanges = 0.0,
    this.versionNumberTextStyle,
    this.releaseSublistNameTextStyle,
    this.changeTextStyle,
  }) : super(key: key);

  /// The [Release]s of your software.
  final List<Release> releases;

  /// The bullet used in the [ReleaseNotesDialog].
  ///
  /// Defaults to '•'.
  final String bullet;

  /// The padding behind the bullets.
  ///
  /// Defaults to 2.5.
  final double bulletPadding;

  /// The padding between the different [Release]s.
  ///
  /// Defaults to 32.5.
  final double paddingBetweenReleases;

  /// The padding beneath the version number of each [Release].
  ///
  /// Defaults to 12.5.
  final double paddingBeneathVersionNumber;

  /// The padding between the [ReleaseSublist]s of each [Release].
  ///
  /// Defaults to 10.0.
  final double paddingBetweenReleaseSublists;

  /// The padding beneath the name of each [ReleaseSublist].
  ///
  /// Defaults to 5.0.
  final double paddingBeneathReleaseSublistName;

  /// The padding between the single changes in each [ReleaseSublist].
  ///
  /// Defaults to 0.0.
  final double paddingBetweenChanges;

  /// The [TextStyle] for the [Release]s version number.
  ///
  /// Defaults to [TextTheme.titleMedium] of [ThemeData.textTheme].
  final TextStyle? versionNumberTextStyle;

  /// The [TextStyle] for the [ReleaseSublist]s name.
  ///
  /// Defaults to [TextTheme.titleSmall] of [ThemeData.textTheme].
  final TextStyle? releaseSublistNameTextStyle;

  /// The [TextStyle] for the each change.
  ///
  /// Defaults to [DialogTheme.contentTextStyle] and if that is null, defaults
  /// to [TextTheme.bodyMedium] of [ThemeData.textTheme].
  final TextStyle? changeTextStyle;

  Widget _getReleases(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);

    final TextStyle? finalVersionNumberTextStyle =
        versionNumberTextStyle ?? theme.textTheme.titleMedium;

    final TextStyle? finalReleaseSublistNameTextStyle =
        releaseSublistNameTextStyle ?? theme.textTheme.titleSmall;

    final TextStyle? finalChangeTextStyle = changeTextStyle ??
        dialogTheme.contentTextStyle ??
        theme.textTheme.bodyMedium;

    List<Widget> _getChanges(ReleaseSublist sublist) {
      List<Widget> widgets = [];

      for (int i = 0; i < sublist.changes.length; i++) {
        widgets.add(Row(
          mainAxisSize: MainAxisSize.min,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sublist.bullet ?? this.bullet),
            SizedBox(
              width: sublist.bulletPadding ?? this.bulletPadding,
            ),
            Expanded(
              child: Text(
                sublist.changes[i],
                style: finalChangeTextStyle,
                textWidthBasis: TextWidthBasis.parent,
              ),
            ),
          ],
        ));

        if (i < sublist.changes.length - 1)
          widgets.add(SizedBox(
            height: paddingBetweenChanges,
          ));
      }

      return widgets;
    }

    List<Widget> _getSublists(Release release) {
      List<Widget> widgets = [];

      for (int i = 0; i < release.subLists.length; i++) {
        widgets.addAll([
          Padding(
            padding: EdgeInsets.only(bottom: paddingBeneathReleaseSublistName),
            child: Text(
              release.subLists[i].name,
              style: finalReleaseSublistNameTextStyle,
            ),
          ),
          ..._getChanges(release.subLists[i])
        ]);

        if (i < release.subLists.length - 1)
          widgets.add(SizedBox(
            height: paddingBetweenReleaseSublists,
          ));
      }

      return widgets;
    }

    List<Widget> widgets = [];

    for (int i = 0; i < releases.length; i++) {
      widgets.addAll([
        Padding(
          padding: EdgeInsets.only(
            bottom: paddingBeneathVersionNumber,
          ),
          child: Text(
            releases[i].versionNumber,
            style: finalVersionNumberTextStyle,
          ),
        ),
        ..._getSublists(releases[i])
      ]);

      if (i < releases.length - 1)
        widgets.add(SizedBox(
          height: paddingBetweenReleases,
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
