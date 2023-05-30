import 'package:release_notes_dialog/src/release_sublist.dart';

/// A [Release] to display in the [ReleaseNotesDialog].
///
/// A [Release] contains a version number and a list of [ReleaseSublist]s.
class Release {
  /// Creates a [Release] to display in the [ReleaseNotesDialog].
  const Release(this.versionNumber, this.subLists);

  /// The verion number of this [Release].
  final String versionNumber;

  /// A List of [ReleaseSublist]s. [ReleaseSublist]s are being used to group
  /// your changes into fitting categories.
  final List<ReleaseSublist> subLists;
}
