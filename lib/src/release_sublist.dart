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
