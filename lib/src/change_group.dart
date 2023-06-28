/// An easy way to group your changes for each [Release].
///
/// A [ChangeGroup] is being used to break down your releases into suitable
/// categories. For example features, bug fixes, improvements or other.
///
/// A [ChangeGroup] contains a name and a list of changes.
class ChangeGroup {
  /// Creates a [ChangeGroup] for your [Release]s to display in the
  /// [ReleaseNotesDialog].
  const ChangeGroup(
    this.title, {
    this.changes = const [],
    this.bullet,
    this.bulletSpacing,
  });

  /// The title of this [ChangeGroup].
  final String title;

  /// The changes in this [ChangeGroup].
  final List<String> changes;

  /// {@macro rnd.widget.bullet}
  ///
  /// It will only be used for this changeGroup.
  final String? bullet;

  /// {@macro rnd.widget.bulletSpacing}
  ///
  /// It will only be used for this changeGroup.
  final double? bulletSpacing;
}
