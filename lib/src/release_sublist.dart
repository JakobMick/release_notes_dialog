/// An easy way to group your changes for each [Release].
///
/// A [ReleaseSublist] is being used to break down your releases into suitable
/// categories. For example features, bug fixes, improvements or other.
///
/// A [ReleaseSublist] contains a name and a list of changes.
class ReleaseSublist {
  /// Creates a [ReleaseSublist] for your [Release]s to display in the
  /// [ReleaseNotesDialog].
  const ReleaseSublist({
    this.title = "Changes",
    this.changes = const [],
    this.bullet,
    this.bulletSpacing,
  });

  /// The title of this [ReleaseSublist].
  final String title;

  /// The changes in this [ReleaseSublist].
  final List<String> changes;

  /// {@macro rnd.widget.bullet}
  ///
  /// It will only be used for this sublist.
  final String? bullet;

  /// {@macro rnd.widget.bulletSpacing}
  ///
  /// It will only be used for this sublist.
  final double? bulletSpacing;
}
