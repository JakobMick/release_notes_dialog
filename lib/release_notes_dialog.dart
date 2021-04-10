library release_notes_dialog;

import 'package:flutter/material.dart';
import 'package:term_glyph/term_glyph.dart' as glyph;

class Release {
  final String versionNumber;
  final List<ReleaseSublist> subLists;

  Release(this.versionNumber, this.subLists);
}

class ReleaseSublist {
  final String name;
  final List<String> changes;

  ReleaseSublist({this.name = "Changes", this.changes = const []});
}

class ReleaseNotesDialog {
  final Key? key;
  final BuildContext context;

  final List<Release> releases;

  final String title;
  final String closeButtonString;

  final Color? backgroundColor;
  final ShapeBorder? shape;
  final double? elevation;
  final String? semanticLabel;

  final double? width;
  final double? height;

  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;
  final double paddingBetweenReleases;
  final double paddingBeneathVersionNumber;
  final double paddingBetweenReleaseSublists;
  final double paddingBeneathReleaseSublistName;
  final double paddingBetweenChanges;

  final TextStyle? titleTextStyle;
  final TextStyle? versionNumberTextStyle;
  final TextStyle? releaseSublistNameTextStyle;
  final TextStyle? changeTextStyle;

  final bool barrierDismissible;

  ReleaseNotesDialog(
    this.context, {
    this.key,
    this.releases = const [],
    this.title = 'Release Notes',
    this.closeButtonString = 'Close',
    //
    this.backgroundColor,
    this.shape,
    this.elevation,
    this.semanticLabel,
    //
    this.width,
    this.height,
    //
    this.titlePadding,
    this.contentPadding,
    this.paddingBetweenReleases = 32.5,
    this.paddingBeneathVersionNumber = 12.5,
    this.paddingBetweenReleaseSublists = 10.0,
    this.paddingBeneathReleaseSublistName = 5.0,
    this.paddingBetweenChanges = 0.0,
    //
    this.titleTextStyle,
    this.versionNumberTextStyle,
    this.releaseSublistNameTextStyle,
    this.changeTextStyle,
    //
    this.barrierDismissible = true,
  });

  Future show() => showDialog(
      context: this.context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return _buildDialog;
      });

  Widget get _buildDialog {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);

    return AlertDialog(
      key: key,
      scrollable: false,
      title: Text(title),
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle ??
          dialogTheme.titleTextStyle ??
          theme.textTheme.headline6!,
      contentPadding:
          contentPadding ?? const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
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
                    style: versionNumberTextStyle ??
                        dialogTheme.titleTextStyle
                            ?.copyWith(fontWeight: FontWeight.bold) ??
                        theme.textTheme.headline6!
                            .copyWith(fontWeight: FontWeight.bold),
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
                            style: releaseSublistNameTextStyle ??
                                dialogTheme.contentTextStyle
                                    ?.copyWith(fontWeight: FontWeight.bold) ??
                                theme.textTheme.bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold),
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
                                    style: changeTextStyle ??
                                        dialogTheme.contentTextStyle ??
                                        theme.textTheme.bodyText1!,
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
          child: Text(closeButtonString),
        )
      ],
    );
  }
}
