import 'package:flutter/cupertino.dart';
import 'package:vk_video/vk_video.dart';

/// Controller for managing the state of the VK Web Player.
class VKVideoController extends ChangeNotifier {
  VKVideoController();

  /// Function to pause the video playback.
  Function() _onPause = () {};
  Function() get onPause => _onPause;

  /// Function to start video playback.
  Function() _onPlay = () {};
  Function() get onPlay => _onPlay;

  /// Function to seek to a specific time in the video.
  Function(Duration duration) _onSeekTo = (Duration duration) {};
  Function(Duration duration) get onSeekTo => _onSeekTo;

  /// Function to seek to the live point in the video.
  Function() _onSeekLive = () {};
  Function() get onSeekLive => _onSeekLive;

  /// Function to set the volume, takes an integer as a parameter.
  Function(int volume) _onSetVolume = (int volume) {};
  Function(int volume) get onSetVolume => _onSetVolume;

  /// Function to get the current volume level, returns an integer or null.
  Function() _triggerVolume = () {};
  Function() get triggerVolume => _triggerVolume;

  /// Default volume set to 1.0
  double? _getVolume = 1.0;
  double? get getVolume => _getVolume;

  /// Function to get the current playback time, returns an integer or null.
  Function() _triggerCurrentTime = () {};
  Function() get triggerCurrentTime => _triggerCurrentTime;

  /// Set default value to 0
  int? _getCurrentTime = 0;
  int? get getCurrentTime => _getCurrentTime;

  /// Function to get the total duration of the video, returns an integer or null.
  Function() _triggerDuration = () {};
  Function() get triggerDuration => _triggerDuration;

  /// Default to null, indicating it might not be set initially
  int? _getDuration = 0;
  int? get getDuration => _getDuration;

  /// Function to retrieve the current video quality/resolution.
  /// It returns a nullable VideoResolution, specifically 'null' if the quality is not set.
  Function() _triggerQuality = () {};
  Function() get triggerQuality => _triggerQuality;

  /// Default to unidentified
  VideoResolutionEnum _getQuality = VideoResolutionEnum.unidentified;
  VideoResolutionEnum get getQuality => _getQuality;

  /// Function to retrieve the current state of the player.
  /// It returns a nullable PlayerState, specifically 'null' if the state is not set.
  Function() _triggerState = () {};
  Function() get triggerState => _triggerState;

  /// Default to unidentified
  PlayerStateEnum _getPlayerState = PlayerStateEnum.unidentified;
  PlayerStateEnum get getPlayerState => _getPlayerState;

  /// Function to mute the video.
  Function() _onMute = () {};
  Function() get onMute => _onMute;

  /// Function to unmute the video.
  Function() _onUnMute = () {};
  Function() get onUnMute => _onUnMute;

  /// Function to check if the video is muted, returns a boolean or null.
  Function() _triggerIsMuted = () {};
  Function() get triggerIsMuted => _triggerIsMuted;

  /// Default to unmuted state
  bool _getIsMuted = false;
  bool get getIsMuted => _getIsMuted;

  /// Variable to hold the video start time as a formatted string (HH:mm:ss).
  Duration _videoStartTime = Duration.zero;
  Duration get videoStartTime => _videoStartTime;

  /// Variable to determine if the video should autoplay.
  /// False indicates that the video will not autoplay by default.
  bool _isAutoPlay = false;
  bool get isAutoPlay => _isAutoPlay;

  /// Notifies all the listeners of changes in the state.
  void setState() {
    /// Call notifyListeners() to inform any listeners that the internal state of this object has changed.
    notifyListeners();
  }

  /// Updates the muted state of the video and notifies listeners of the change.
  void setIsMuted(bool isMuted) {
    /// Set the muted state to the new value passed as an argument.
    _getIsMuted = isMuted;
  }

  /// Updates the current volume level of the video and notifies listeners of the change.
  void setVolume(double volume) {
    /// Set the current volume level to the new value passed as an argument.
    _getVolume = volume;
  }

  /// Updates the current playback time of the video and notifies listeners of the change.
  void setCurrentTime(int currentTime) {
    /// Set the current playback time to the new value passed as an argument.
    _getCurrentTime = currentTime;
  }

  /// Updates the current duration of the video and notifies listeners of the change.
  void setDuration(int duration) {
    /// Set the current duration to the new value passed as an argument
    _getDuration = duration;
  }

  /// Updates the current video quality/resolution and notifies listeners of the change.
  void setQuality(VideoResolutionEnum quality) {
    /// Update the current video quality to the new value
    _getQuality = quality;
  }

  /// Updates the current state of the player and notifies listeners of the change.
  void setPlayerState(PlayerStateEnum playerState) {
    /// Optionally, include logic to handle any specific state transitions, if necessary.
    _getPlayerState = playerState;
  }

  /// Method to set the video start time using a Duration.
  void setVideoStartTimeInSeconds(Duration videoStartTime) {
    /// Update the instance variable with the new formatted video start time.
    _videoStartTime = videoStartTime;
  }

  /// Method to set the autoplay status of the video.
  void setIsAutoPlay(bool isAutoPlay) {
    /// Update the instance variable with the new autoplay status.
    _isAutoPlay = isAutoPlay;
  }

  /// Method to set the functions for controlling the player.
  void setMethods({
    /// Function to pause the playback.
    required Function() onPause,

    /// Function to play the media.
    required Function() onPlay,

    /// Function to seek to a specific duration.
    required Function(Duration duration) onSeekTo,

    /// Function to seek to live playback.
    required Function() onSeekLive,

    /// Function to set the volume.
    required Function(int volume) onSetVolume,

    /// Function to get the current volume.
    required Function() triggerVolume,

    /// Function to get the current playback time.
    required Function() triggerCurrentTime,

    /// Function to get the total duration.
    required Function() triggerDuration,

    /// Required function to retrieve the current video quality/resolution.
    /// It returns a nullable VideoResolution, which may indicate the current quality of the video being played.
    required Function() triggerQuality,

    /// Function to mute the audio.
    required Function() onMute,

    /// Function to unmute the audio.
    required Function() onUnMute,

    /// Function to check if the audio is muted.
    required Function() triggerIsMuted,

    /// Required function to retrieve the current state of the player.
    /// It returns a nullable PlayerState, which may indicate the player's current status.
    required Function() triggerState,
  }) {
    /// Set the pause function.
    _onPause = onPause;

    /// Set the play function.
    _onPlay = onPlay;

    /// Set the seek function.
    _onSeekTo = onSeekTo;

    /// Set the live seek function.
    _onSeekLive = onSeekLive;

    /// Set the volume function.
    _onSetVolume = onSetVolume;

    /// Set the function to get the current volume.
    _triggerVolume = triggerVolume;

    /// Set the function to get the current playback time.
    _triggerCurrentTime = triggerCurrentTime;

    /// Set the function to get the total duration.
    _triggerDuration = triggerDuration;

    /// Set the getQuality function.
    _triggerQuality = triggerQuality;

    /// Set the mute function.
    _onMute = onMute;

    /// Set the unmute function.
    _onUnMute = onUnMute;

    /// Set the function to check if the audio is muted.
    _triggerIsMuted = triggerIsMuted;

    /// Set the getState function.
    _triggerState = triggerState;
  }
}
