library release_notes_dialog;

import 'package:flutter/material.dart';
import 'package:term_glyph/term_glyph.dart' as glyph;

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
  const ReleaseSublist({this.name = "Changes", this.changes = const []});

  /// The name of this [ReleaseSublist].
  final String name;

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
    this.closeButtonString = 'Close',
    this.width,
    this.height,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.semanticLabel = 'Release Notes',
    this.titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
    this.paddingBetweenReleases = 32.5,
    this.paddingBeneathVersionNumber = 12.5,
    this.paddingBetweenReleaseSublists = 10.0,
    this.paddingBeneathReleaseSublistName = 5.0,
    this.paddingBetweenChanges = 0.0,
    this.titleTextStyle,
    this.versionNumberTextStyle,
    this.releaseSublistNameTextStyle,
    this.closeButtonTextStyle,
    this.changeTextStyle,
  }) : super(key: key);

  /// The [Release]s of your software.
  final List<Release> releases;

  /// The title of the [ReleaseNotesDialog].
  ///
  /// Defaults to 'Release Notes'.
  final String title;

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
  /// [TextTheme.headline6] of [ThemeData.textTheme]. Both of these defaults are
  /// copied with [FontWeight.bold].
  final TextStyle? titleTextStyle;

  /// The [TextStyle] for the [Release]s version number.
  ///
  /// Defaults to [DialogTheme.titleTextStyle] and if that is null, defaults to
  /// [TextTheme.headline6] of [ThemeData.textTheme]. Both of these defaults are
  /// copied with [FontWeight.bold].
  final TextStyle? versionNumberTextStyle;

  /// The [TextStyle] for the [ReleaseSublist]s name.
  ///
  /// Defaults to [DialogTheme.contentTextStyle] and if that is null, defaults to
  /// [TextTheme.bodyText1] of [ThemeData.textTheme]. Both of these defaults are
  /// copied with [FontWeight.bold].
  final TextStyle? releaseSublistNameTextStyle;

  /// The [TextStyle] for the each change.
  ///
  /// Defaults to [DialogTheme.contentTextStyle] and if that is null, defaults to
  /// [TextTheme.bodyText1] of [ThemeData.textTheme].
  final TextStyle? changeTextStyle;

  /// The [TextStyle] for the [ReleaseSublist]s name.
  ///
  /// Defaults to [DialogTheme.contentTextStyle] and if that is null, defaults to
  /// [TextTheme.bodyText1] of [ThemeData.textTheme]. Both of these defaults are
  /// copied with [FontWeight.bold].
  final TextStyle? closeButtonTextStyle;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);

    final TextStyle finalTitleTextStyle = titleTextStyle ??
        (dialogTheme.titleTextStyle ?? theme.textTheme.headline6!)
            .copyWith(fontWeight: FontWeight.bold);

    final TextStyle finalVersionNumberTextStyle = versionNumberTextStyle ??
        (dialogTheme.titleTextStyle ?? theme.textTheme.headline6!)
            .copyWith(fontWeight: FontWeight.bold);

    final TextStyle finalReleaseSublistNameTextStyle =
        releaseSublistNameTextStyle ??
            (dialogTheme.contentTextStyle ?? theme.textTheme.bodyText1!)
                .copyWith(fontWeight: FontWeight.bold);

    final TextStyle finalChangeTextStyle = changeTextStyle ??
        dialogTheme.contentTextStyle ??
        theme.textTheme.bodyText1!;

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
      content: Container(
        width: width ?? mediaQuery.size.width * 0.75,
        height: height ?? mediaQuery.size.height * 0.75,
        //
        // Release Listview
        //
        child: ListView.separated(
          itemCount: releases.length,
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
                          itemBuilder: (BuildContext context, int changeIndex) {
                            return Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Text(glyph.bullet + " "),
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
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: paddingBetweenChanges,
                            );
                          },
                        )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: paddingBetweenReleaseSublists,
                    );
                  },
                )
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: paddingBetweenReleases,
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(closeButtonString,style:closeButtonTextStyle),
        )
      ],
    );
  }
}
