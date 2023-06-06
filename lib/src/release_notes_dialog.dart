import 'package:flutter/material.dart';

import 'package:release_notes_dialog/src/release_notes_widget.dart';
import 'package:release_notes_dialog/src/release.dart';

/// Displays a [ReleaseNotesDialog], which informs the user about changes to
/// the software.
///
/// The arguments correspond to the properties on [ReleaseNotesDialog] and
/// [showDialog].
void showReleaseNotesDialog({
  required BuildContext context,
  required List<Release> releases,
  String? bullet,
  double? bulletSpacing,
  double? releaseSpacing,
  double? releaseTitleSpacing,
  double? sublistSpacing,
  double? sublistTitleSpacing,
  double? changeSpacing,
  TextStyle? releaseTitleTextStyle,
  TextStyle? sublistTitleTextStyle,
  TextStyle? changeTextStyle,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
}) {
  showDialog<void>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (BuildContext context) {
      return ReleaseNotesDialog(
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
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
  );
}

/// An easy to use and customizable [ReleaseNotesDialog].
///
/// A [ReleaseNotesDialog] informs the user about changes to the software.
///
/// The arguments correspond to the properties on [ReleaseNotesWidget] and
/// [AlertDialog].
class ReleaseNotesDialog extends StatelessWidget {
  /// Creates a [ReleaseNotesDialog].
  ///
  /// Only the releases are required. All other arguments are optional.
  ///
  /// Typically used in conjunction with [showDialog].
  const ReleaseNotesDialog({
    Key? key,
    required this.releases,
    this.title = 'Release Notes',
    this.bullet,
    this.closeButtonString,
    this.titlePadding,
    this.contentPadding,
    this.actionsPadding,
    this.actionsAlignment,
    this.actionsOverflowAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.buttonPadding,
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
    this.closeButtonTextStyle,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.alignment,
    this.insetPadding =
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    this.clipBehavior = Clip.none,
    this.shape,
    this.semanticLabel = 'Release Notes',
  }) : super(key: key);

  /// {@macro rnd.widget.releases}
  final List<Release> releases;

  /// The title of the [ReleaseNotesDialog].
  ///
  /// Defaults to 'Release Notes'.
  final String title;

  /// {@macro rnd.widget.bullet}
  final String? bullet;

  /// The string of close button.
  final String? closeButtonString;

  /// {@macro flutter.material.dialog.backgroundColor}
  final Color? backgroundColor;

  /// {@macro flutter.material.dialog.elevation}
  final double? elevation;

  /// {@macro flutter.material.dialog.shadowColor}
  final Color? shadowColor;

  /// {@macro flutter.material.dialog.surfaceTintColor}
  final Color? surfaceTintColor;

  /// {@macro flutter.material.dialog.shape}
  final ShapeBorder? shape;

  /// {@macro flutter.material.dialog.alignment}
  final AlignmentGeometry? alignment;

  /// {@macro flutter.material.dialog.insetPadding}
  final EdgeInsets insetPadding;

  /// {@macro flutter.material.dialog.clipBehavior}
  final Clip clipBehavior;

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
  final EdgeInsetsGeometry? titlePadding;

  /// The padding around the dialogs content.
  final EdgeInsetsGeometry? contentPadding;

  /// The padding around the dialogs actions.
  final EdgeInsetsGeometry? actionsPadding;

  /// Defines the horizontal layout of the [actions] according to the same
  /// rules as for [Row.mainAxisAlignment].
  ///
  /// This parameter is passed along to the dialog's [OverflowBar].
  ///
  /// If this parameter is null (the default) then [MainAxisAlignment.end]
  /// is used.
  final MainAxisAlignment? actionsAlignment;

  /// The horizontal alignment of [actions] within the vertical
  /// "overflow" layout.
  ///
  /// If the dialog's [actions] do not fit into a single row, then they
  /// are arranged in a column. This parameter controls the horizontal
  /// alignment of widgets in the case of an overflow.
  ///
  /// If this parameter is null (the default) then [OverflowBarAlignment.end]
  /// is used.
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  final OverflowBarAlignment? actionsOverflowAlignment;

  /// The vertical direction of [actions] if the children overflow
  /// horizontally.
  ///
  /// If the dialog's [actions] do not fit into a single row, then they
  /// are arranged in a column. The first action is at the top of the
  /// column if this property is set to [VerticalDirection.down], since it
  /// "starts" at the top and "ends" at the bottom. On the other hand,
  /// the first action will be at the bottom of the column if this
  /// property is set to [VerticalDirection.up], since it "starts" at the
  /// bottom and "ends" at the top.
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  final VerticalDirection? actionsOverflowDirection;

  /// The spacing between [actions] when the [OverflowBar] switches to a column
  /// layout because the actions don't fit horizontally.
  ///
  /// If the widgets in [actions] do not fit into a single row, they are
  /// arranged into a column. This parameter provides additional vertical space
  /// between buttons when it does overflow.
  ///
  /// The button spacing may appear to be more than the value provided. This is
  /// because most buttons adhere to the [MaterialTapTargetSize] of 48px. So,
  /// even though a button might visually be 36px in height, it might still take
  /// up to 48px vertically.
  ///
  /// If null then no spacing will be added in between buttons in an overflow
  /// state.
  final double? actionsOverflowButtonSpacing;

  /// The padding that surrounds each button in [actions].
  ///
  /// This is different from [actionsPadding], which defines the padding
  /// between the entire button bar and the edges of the dialog.
  ///
  /// If this property is null, then it will default to
  /// 8.0 logical pixels on the left and right.
  final EdgeInsetsGeometry? buttonPadding;

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
      actionsPadding: actionsPadding,
      actionsAlignment: actionsAlignment,
      actionsOverflowAlignment: actionsOverflowAlignment,
      actionsOverflowDirection: actionsOverflowDirection,
      actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
      buttonPadding: buttonPadding,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      insetPadding: insetPadding,
      clipBehavior: clipBehavior,
      alignment: alignment,
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
