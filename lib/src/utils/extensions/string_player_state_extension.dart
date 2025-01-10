import 'package:vk_video/vk_video.dart';

extension StringPlayerStateExtension on String {
  /// Converts a string to the corresponding PlayerStateEnum value.
  /// If the string does not match any enum value, it returns PlayerStateEnum.unidentified.
  PlayerStateEnum toPlayerStateEnum() {
    switch (this) {
      case 'uninited':
        return PlayerStateEnum.uninited;
      case 'unstarted':
        return PlayerStateEnum.unstarted;
      case 'playing':
        return PlayerStateEnum.playing;
      case 'paused':
        return PlayerStateEnum.paused;
      case 'ended':
        return PlayerStateEnum.ended;
      case 'error':
        return PlayerStateEnum.error;
      default:
        // If none of the cases match, return unidentified state
        return PlayerStateEnum.unidentified;
    }
  }
}
