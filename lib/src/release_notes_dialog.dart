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
    this.width,
    this.height,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.semanticLabel = 'Release Notes',
    this.titlePadding,
    this.contentPadding,
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
  final String? closeButtonString;

  /// The width of the dialog.
  ///
  /// Defaults to mediaQuery.size.width * 0.75.
  final double? width;

  /// The height of the dialog.
  ///
  /// Defaults to mediaQuery.size.height * 0.75.
  final double? height;

  /// {@macro flutter.material.dialog.backgroundColor}
  final Color? backgroundColor;

  /// {@macro flutter.material.dialog.elevation}
  final double? elevation;

  /// {@macro flutter.material.dialog.shape}
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
  final EdgeInsetsGeometry? titlePadding;

  /// The padding around the dialogs content.
  ///
  /// Defaults to const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0).
  final EdgeInsetsGeometry? contentPadding;

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
  /// Defaults to [DialogTheme.contentTextStyle] and if that is null, defaults
  /// to [TextTheme.bodyMedium] of [ThemeData.textTheme].
  final TextStyle? changeTextStyle;

  /// The [TextStyle] for the [ReleaseSublist]s close button.
  ///
  /// Defaults to [DialogTheme.contentTextStyle] and if that is null, defaults
  /// to [TextTheme.bodyMedium] of [ThemeData.textTheme].
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
