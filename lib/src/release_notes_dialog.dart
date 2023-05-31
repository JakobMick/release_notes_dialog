import 'package:flutter/material.dart';

import 'package:release_notes_dialog/src/release_notes_widget.dart';
import 'package:release_notes_dialog/src/release.dart';

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
    this.closeButtonString,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.semanticLabel = 'Release Notes',
    this.titlePadding,
    this.contentPadding,
    this.bulletSpacing = 2.5,
    this.releaseSpacing = 12.5,
    this.releaseTitleSpacing = 12.5,
    this.sublistSpacing = 10.0,
    this.sublistTitleSpacing = 5.0,
    this.changeSpacing = 0.0,
    this.titleTextStyle,
    this.releaseTitleTextStyle,
    this.sublistTitleTextStyle,
    this.changeTextStyle,
    this.closeButtonTextStyle,
  }) : super(key: key);

  /// {@macro rnd.widget.releases}
  final List<Release> releases;

  /// The title of the [ReleaseNotesDialog].
  ///
  /// Defaults to 'Release Notes'.
  final String title;

  /// {@macro rnd.widget.bullet}
  final String bullet;

  /// The string of close button.
  final String? closeButtonString;

  /// {@macro flutter.material.dialog.backgroundColor}
  final Color? backgroundColor;

  /// {@macro flutter.material.dialog.elevation}
  final double? elevation;

  /// {@macro flutter.material.dialog.shape}
  final ShapeBorder? shape;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the dialog is opened and closed.
  ///
  /// Defaults to 'Release Notes'.
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.namesRoute], for a description of how this
  ///    value is used.
  final String semanticLabel;

  /// The padding around the dialogs title.
  ///
  /// Defaults to const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0).
  final EdgeInsetsGeometry? titlePadding;

  /// The padding around the dialogs content.
  ///
  /// Defaults to const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0).
  final EdgeInsetsGeometry? contentPadding;

  /// {@macro rnd.widget.bulletSpacing}
  final double bulletSpacing;

  /// {@macro rnd.widget.releaseSpacing}
  final double releaseSpacing;

  /// {@macro rnd.widget.releaseTitleSpacing}
  final double releaseTitleSpacing;

  /// {@macro rnd.widget.sublistSpacing}
  final double sublistSpacing;

  /// {@macro rnd.widget.sublistTitleSpacing}
  final double sublistTitleSpacing;

  /// {@macro rnd.widget.changeSpacing}
  final double changeSpacing;

  /// The [TextStyle] for the dialogs title.
  final TextStyle? titleTextStyle;

  /// {@macro rnd.widget.releaseTitleTextStyle}
  final TextStyle? releaseTitleTextStyle;

  /// {@macro rnd.widget.sublistTitleTextStyle}
  final TextStyle? sublistTitleTextStyle;

  /// {@macro rnd.widget.changeTextStyle}
  final TextStyle? changeTextStyle;

  /// The [TextStyle] for the [ReleaseNotesDialog]s close button.
  final TextStyle? closeButtonTextStyle;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    return AlertDialog(
      key: key,
      scrollable: true,
      title: Text(title),
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
      contentPadding: contentPadding,
      contentTextStyle: changeTextStyle,
      backgroundColor: backgroundColor,
      shape: shape,
      elevation: elevation,
      semanticLabel: semanticLabel,
      content: ReleaseNotesWidget(
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
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            closeButtonString ??
                (theme.useMaterial3
                    ? localizations.closeButtonLabel
                    : localizations.closeButtonLabel.toUpperCase()),
            style: closeButtonTextStyle,
          ),
        )
      ],
    );
  }
}
