import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);

    final TextStyle? finalVersionNumberTextStyle =
        versionNumberTextStyle ?? theme.textTheme.titleMedium;

    final TextStyle? finalReleaseSublistNameTextStyle =
        releaseSublistNameTextStyle ?? theme.textTheme.titleSmall;

    final TextStyle? finalChangeTextStyle = changeTextStyle ??
        dialogTheme.contentTextStyle ??
        theme.textTheme.bodyMedium;

    return ListView.separated(
      itemCount: releases.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: paddingBetweenReleases,
        );
      },
      itemBuilder: (BuildContext context, int releaseIndex) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: paddingBeneathVersionNumber,
              ),
              child: Text(
                releases[releaseIndex].versionNumber,
                style: finalVersionNumberTextStyle,
              ),
            ),
            //
            // Sublist Listview
            //
            ListView.separated(
              itemCount: releases[releaseIndex].subLists.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: paddingBetweenReleaseSublists,
                );
              },
              itemBuilder: (BuildContext context, int sublistIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: paddingBeneathReleaseSublistName),
                      child: Text(
                        releases[releaseIndex].subLists[sublistIndex].name,
                        style: finalReleaseSublistNameTextStyle,
                      ),
                    ),
                    //
                    // Changes Listview
                    //
                    ListView.separated(
                      itemCount: releases[releaseIndex]
                          .subLists[sublistIndex]
                          .changes
                          .length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: paddingBetweenChanges,
                        );
                      },
                      itemBuilder: (BuildContext context, int changeIndex) {
                        return Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(releases[releaseIndex]
                                    .subLists[sublistIndex]
                                    .bullet ??
                                this.bullet),
                            SizedBox(
                              width: releases[releaseIndex]
                                      .subLists[sublistIndex]
                                      .bulletPadding ??
                                  this.bulletPadding,
                            ),
                            Expanded(
                              child: Text(
                                releases[releaseIndex]
                                    .subLists[sublistIndex]
                                    .changes[changeIndex],
                                style: finalChangeTextStyle,
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              },
            )
          ],
        );
      },
    );
  }
}
