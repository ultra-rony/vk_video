/// Enum representing the various states of a video player.
enum PlayerStateEnum {
  unidentified, // State when the player state is unknown.

  /// The iframe with the video has not loaded, and the player is not initialized.
  uninited,

  /// Video playback has not started.
  unstarted,

  /// The video is currently playing.
  playing,

  /// Playback has been paused.
  paused,

  /// Video playback has finished.
  ended,

  /// An error occurred during video playback.
  error,
}
