import 'package:flutter/cupertino.dart';
import 'package:vk_video/vk_video.dart';

/// Controller for managing the state of the VK Web Player.
class VKVideoController extends ChangeNotifier {
  VKVideoController();

  /// Function to pause the video playback.
  Function() onPause = () {};

  /// Function to start video playback.
  Function() onPlay = () {};

  /// Function to seek to a specific time in the video.
  Function(Duration duration) onSeekTo = (Duration duration) {};

  /// Function to seek to the live point in the video.
  Function() onSeekLive = () {};

  /// Function to set the volume, takes an integer as a parameter.
  Function(int volume) onSetVolume = (int volume) {};

  /// Function to get the current volume level, returns an integer or null.
  Function() triggerVolume = () {};

  /// Default volume set to 1.0
  double? getVolume = 1.0;

  /// Function to get the current playback time, returns an integer or null.
  Function() triggerCurrentTime = () {};

  /// Set default value to 0
  int? getCurrentTime = 0;

  /// Function to get the total duration of the video, returns an integer or null.
  Function() triggerDuration = () {};

  /// Default to null, indicating it might not be set initially
  int? getDuration = 0;

  /// Function to retrieve the current video quality/resolution.
  /// It returns a nullable VideoResolution, specifically 'null' if the quality is not set.
  Function() triggerQuality = () {};

  /// Default to unidentified
  VideoResolutionEnum getQuality = VideoResolutionEnum.unidentified;

  /// Function to retrieve the current state of the player.
  /// It returns a nullable PlayerState, specifically 'null' if the state is not set.
  Function() triggerState = () {};

  /// Default to unidentified
  PlayerStateEnum getState = PlayerStateEnum.unidentified;

  /// Function to mute the video.
  Function() onMute = () {};

  /// Function to unmute the video.
  Function() onUnMute = () {};

  /// Function to check if the video is muted, returns a boolean or null.
  Function() triggerIsMuted = () {};

  /// Default to unmuted state
  bool getIsMuted = false;

  /// Variable to hold the video start time as a formatted string (HH:mm:ss).
  Duration videoStartTime = Duration.zero;

  /// Variable to determine if the video should autoplay.
  /// False indicates that the video will not autoplay by default.
  bool isAutoPlay = false;

  /// Updates the muted state of the video and notifies listeners of the change.
  void setIsMuted(bool isMuted) {
    /// Set the muted state to the new value passed as an argument.
    getIsMuted = isMuted;

    /// Notify all listeners that the muted state has changed.
    notifyListeners();
  }

  /// Updates the current volume level of the video and notifies listeners of the change.
  void setVolume(double volume) {
    /// Set the current volume level to the new value passed as an argument.
    getVolume = volume;

    /// Notify all listeners that the volume level has changed.
    notifyListeners();
  }

  /// Updates the current playback time of the video and notifies listeners of the change.
  void setCurrentTime(int currentTime) {
    /// Set the current playback time to the new value passed as an argument.
    getCurrentTime = currentTime;

    /// Notify all listeners that the current playback time has changed.
    notifyListeners();
  }

  /// Updates the current duration of the video and notifies listeners of the change.
  void setDuration(int duration) {
    /// Set the current duration to the new value passed as an argument
    getDuration = duration;

    /// Notify all listeners that the video duration has changed
    notifyListeners();
  }

  /// Updates the current video quality/resolution and notifies listeners of the change.
  void setQuality(VideoResolutionEnum quality) {
    /// Update the current video quality to the new value
    getQuality = quality;

    /// Notify all listeners that the video quality has changed
    notifyListeners();
  }

  /// Updates the current state of the player and notifies listeners of the change.
  void setState(PlayerStateEnum playerState) {
    /// Optionally, include logic to handle any specific state transitions, if necessary.
    getState = playerState;

    /// Notify listeners about the change
    notifyListeners();
  }

  /// Method to set the video start time using a Duration.
  void setVideoStartTimeInSeconds(Duration videoStartTime) {
    /// Update the instance variable with the new formatted video start time.
    this.videoStartTime = videoStartTime;

    /// Notify all listeners about the change in video start time.
    notifyListeners();
  }

  /// Method to set the autoplay status of the video.
  void setIsAutoPlay(bool isAutoPlay) {
    /// Update the instance variable with the new autoplay status.
    this.isAutoPlay = isAutoPlay;

    /// Notify listeners about the change in autoplay status.
    notifyListeners();
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
    this.onPause = onPause;

    /// Set the play function.
    this.onPlay = onPlay;

    /// Set the seek function.
    this.onSeekTo = onSeekTo;

    /// Set the live seek function.
    this.onSeekLive = onSeekLive;

    /// Set the volume function.
    this.onSetVolume = onSetVolume;

    /// Set the function to get the current volume.
    this.triggerVolume = triggerVolume;

    /// Set the function to get the current playback time.
    this.triggerCurrentTime = triggerCurrentTime;

    /// Set the function to get the total duration.
    this.triggerDuration = triggerDuration;

    /// Set the getQuality function.
    this.triggerQuality = triggerQuality;

    /// Set the mute function.
    this.onMute = onMute;

    /// Set the unmute function.
    this.onUnMute = onUnMute;

    /// Set the function to check if the audio is muted.
    this.triggerIsMuted = triggerIsMuted;

    /// Set the getState function.
    this.triggerState = triggerState;

    /// Notify listeners that the methods have changed.
    notifyListeners();
  }
}
