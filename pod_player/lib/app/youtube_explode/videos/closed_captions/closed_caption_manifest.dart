import 'dart:collection';

import 'closed_caption_format.dart';
import 'closed_caption_track_info.dart';

/// Manifest that contains information about available closed caption tracks
/// in a specific video.
class ClosedCaptionManifest {
  /// Available closed caption tracks.
  final UnmodifiableListView<ClosedCaptionTrackInfo> tracks;

  /// Initializes an instance of [ClosedCaptionManifest]
  ClosedCaptionManifest(Iterable<ClosedCaptionTrackInfo> tracks)
      : tracks = UnmodifiableListView(tracks);

  /// Gets all the closed caption tracks in the specified language and format.
  /// If [autoGenerated] is true auto generated tracks are included as well.
  /// Returns an empty list of no track is found.
  List<ClosedCaptionTrackInfo> getByLanguage(String language,
      {ClosedCaptionFormat? format, bool autoGenerated = false}) {
    language = language.toLowerCase();
    return tracks
        .where((e) =>
            (e.language.code.toLowerCase() == language ||
                e.language.name.toLowerCase() == language) &&
            (format == null || e.format == format) &&
            (autoGenerated || !e.isAutoGenerated))
        .toList();
  }
}

bool x(bool autoGen, bool isAuto) {
  if (!autoGen) {
    return !isAuto;
  }
  return true;
}
/*
A = 0
B = 1

A B
0 0 -> 1 |
0 1 -> 0 -> 1 | 1 ->
1 0 -> 1
1 1 -> 1

 */