import 'package:release_notes_dialog/src/change_group.dart';

/// A [Release] to display in the [ReleaseNotesDialog].
///
/// A [Release] contains a version number and a list of [ChangeGroup]s.
class Release {
  /// Creates a [Release] to display in the [ReleaseNotesDialog].
  const Release(this.title, this.changeGroups);

  /// The title of this [Release].
  final String title;

  /// A List of [ChangeGroup]s. [ChangeGroup]s are being used to group
  /// your changes into fitting categories.
  final List<ChangeGroup> changeGroups;
}
