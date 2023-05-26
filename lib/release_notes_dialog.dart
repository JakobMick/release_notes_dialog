library release_notes_dialog;

import 'package:flutter/material.dart';

/// A [Release] to display in the [ReleaseNotesDialog].
///
/// A [Release] contains a version number and a list of [ReleaseSublist]s.
class Release {
  /// Creates a [Release] to display in the [ReleaseNotesDialog].
  const Release(this.versionNumber, this.subLists);

  /// The verion number of this [Release].
  final String versionNumber;

  /// A List of [ReleaseSublist]s. [ReleaseSublist]s are being used to group your
  /// changes into fitting categories.
  final List<ReleaseSublist> subLists;
}

/// An easy way to group your changes for each [Release].
///
/// A [ReleaseSublist] is being used to break down your releases into suitable categories.
/// For example features, bug fixes, improvements or other.
///
/// A [ReleaseSublist] contains a name and a list of changes.
class ReleaseSublist {
  /// Creates a [ReleaseSublist] for your [Release]s to display in the [ReleaseNotesDialog].
  const ReleaseSublist({
    this.name = "Changes",
    this.bullet,
    this.bulletPadding,
    this.changes = const [],
  });

  /// The name of this [ReleaseSublist].
  final String name;

  /// The bullet used for this [ReleaseSublist]. If null, the
  /// [ReleaseNotesDialog]'s bullet property is used. It defualts to '•'.
  final String? bullet;

  /// The padding behind the bullets used for this [ReleaseSublist]. If null,
  /// the [ReleaseNotesDialog]'s bulletPadding property is used. It defualts to
  /// 2.5.
  final double? bulletPadding;

  /// The changes in this [ReleaseSublist].
  final List<String> changes;
}

/// An easy to use and customizable [ReleaseNotesDialog].
///
/// A [ReleaseNotesDialog] informs the user about changes to the software.
class ReleaseNotesDialog extends StatelessWidget {
  /// Creates a [ReleaseNotesDialog].
  ///
  /// Typically used in conjunction with [showDialog].
  const ReleaseNotesDialog({
    Key? key,
    required this.releases,
    this.title = 'Release Notes',
    this.bullet = '•',
    this.closeButtonString = 'Close',
    this.width,
    this.height,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.semanticLabel = 'Release Notes',
    this.titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
    this.bulletPadding = 2.5,
    this.paddingBetweenReleases = 32.5,
    this.paddingBeneathVersionNumber = 12.5,
    this.paddingBetweenReleaseSublists = 10.0,
    this.paddingBeneathReleaseSublistName = 5.0,
    this.paddingBetweenChanges = 0.0,
    this.titleTextStyle,
    this.versionNumberTextStyle,
    this.releaseSublistNameTextStyle,
    this.changeTextStyle,
    this.closeButtonTextStyle,
  }) : super(key: key);

  /// The [Release]s of your software.
  final List<Release> releases;

  /// The title of the [ReleaseNotesDialog].
  ///
  /// Defaults to 'Release Notes'.
  final String title;

  /// The bullet used in the [ReleaseNotesDialog].
  ///
  /// Defaults to '•'.
  final String bullet;

  /// The string of close button.
  ///
  /// Defaults to 'Close'.
  final String closeButtonString;

  /// The width of the dialog.
  ///
  /// Defaults to mediaQuery.size.width * 0.75.
  final double? width;

  /// The height of the dialog.
  ///
  /// Defaults to mediaQuery.size.height * 0.75.
  final double? height;

  /// The background color of the dialog.
  ///
  /// Defaults to [ThemeData.dialogBackgroundColor].
  final Color? backgroundColor;

  /// The z-coordinate of the dialog.
  ///
  /// Defaults to [DialogTheme.elevation] and if that is null, defaults to 24.0.
  final double? elevation;

  /// The shape of the dialog's border.
  ///
  /// Defaults to a [RoundedRectangleBorder] with a radius of 4.0.
  final ShapeBorder? shape;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the dialog is opened and closed.
  ///
  /// Default to 'Release Notes'.
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.namesRoute], for a description of how this
  ///    value is used.
  final String semanticLabel;

  /// The padding around the dialogs title.
  ///
  /// Defaults to const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0).
  final EdgeInsetsGeometry titlePadding;

  /// The padding around the dialogs content.
  ///
  /// Defaults to const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0).
  final EdgeInsetsGeometry contentPadding;

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

  /// The [TextStyle] for the dialogs title.
  ///
  /// Defaults to [DialogTheme.titleTextStyle] and if that is null, defaults to
  /// [TextTheme.headlineMedium] of [ThemeData.textTheme]..
  final TextStyle? titleTextStyle;

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
  /// Defaults to [DialogTheme.contentTextStyle] and if that is null, defaults to
  /// [TextTheme.bodyMedium] of [ThemeData.textTheme].
  final TextStyle? changeTextStyle;

  /// The [TextStyle] for the [ReleaseSublist]s close button.
  ///
  /// Defaults to [DialogTheme.contentTextStyle] and if that is null, defaults to
  /// [TextTheme.bodyMedium] of [ThemeData.textTheme].
  final TextStyle? closeButtonTextStyle;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);

    final TextStyle? finalTitleTextStyle = titleTextStyle ??
        dialogTheme.titleTextStyle ??
        theme.textTheme.headlineMedium;

    final TextStyle? finalVersionNumberTextStyle =
        versionNumberTextStyle ?? theme.textTheme.titleMedium;

    final TextStyle? finalReleaseSublistNameTextStyle =
        releaseSublistNameTextStyle ?? theme.textTheme.titleSmall;

    final TextStyle? finalChangeTextStyle = changeTextStyle ??
        dialogTheme.contentTextStyle ??
        theme.textTheme.bodyMedium;

    final TextStyle? finalCloseButtonTextStyle = closeButtonTextStyle ??
        dialogTheme.contentTextStyle ??
        theme.textTheme.bodyMedium;

    return AlertDialog(
      key: key,
      scrollable: false,
      title: Text(title),
      titlePadding: titlePadding,
      titleTextStyle: finalTitleTextStyle,
      contentPadding: contentPadding,
      contentTextStyle: changeTextStyle,
      backgroundColor: backgroundColor,
      shape: shape,
      elevation: elevation,
      semanticLabel: semanticLabel,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(closeButtonString, style: finalCloseButtonTextStyle),
        )
      ],
      content: Container(
        width: width ?? mediaQuery.size.width * 0.75,
        height: height ?? mediaQuery.size.height * 0.75,
        //
        // Release Listview
        //
        child: ListView.separated(
          itemCount: releases.length,
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
                                Text((releases[releaseIndex]
                                            .subLists[sublistIndex]
                                            .bullet ??
                                        this.bullet) +
                                    " "),
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
        ),
      ),
    );
  }
}
