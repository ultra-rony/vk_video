import 'package:vk_video/vk_video.dart';

/// Extension on String to convert quality values to VideoResolutionEnum.
extension VideoQualityExtension on String {
  /// Maps the string quality value to the corresponding VideoResolutionEnum.
  /// If the string does not match any expected value, it returns VideoResolutionEnum.unidentified.
  VideoResolutionEnum toVideoResolutionPosition() {
    switch (this) {
      case "360.0":
        return VideoResolutionEnum.p360;
      case "480.0":
        return VideoResolutionEnum.p480;
      case "720.0":
        return VideoResolutionEnum.p720;
      case "1080.0":
        return VideoResolutionEnum.p1080;
      default:
        /// If none of the cases match, return unidentified state
        return VideoResolutionEnum.unidentified;
    }
  }
}