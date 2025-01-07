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
  double? getVolume = 1.0;

  /// Function to get the current playback time, returns an integer or null.
  Function() triggerCurrentTime = () {};
  int? getCurrentTime = 0;

  /// Function to get the total duration of the video, returns an integer or null.
  Function() triggerDuration = () {};
  int? getDuration = 0;

  /// Function to retrieve the current video quality/resolution.
  /// It returns a nullable VideoResolution, specifically 'null' if the quality is not set.
  Function() triggerQuality = () {};
  VideoResolutionEnum getQuality = VideoResolutionEnum.unidentified;

  /// Function to retrieve the current state of the player.
  /// It returns a nullable PlayerState, specifically 'null' if the state is not set.
  Function() triggerState = () {};
  PlayerStateEnum getState = PlayerStateEnum.unidentified;

  /// Function to mute the video.
  Function() onMute = () {};

  /// Function to unmute the video.
  Function() onUnMute = () {};

  /// Function to check if the video is muted, returns a boolean or null.
  Function() triggerIsMuted = () {};
  bool getIsMuted = false;

  /// Variable to hold the video start time as a formatted string (HH:mm:ss).
  Duration videoStartTime = Duration.zero;

  /// Variable to determine if the video should autoplay.
  /// False indicates that the video will not autoplay by default.
  bool isAutoPlay = false;

  /// Method to set muted state and notify listeners.
  void setIsMuted(bool isMuted) {
    getIsMuted = isMuted;
    notifyListeners();
  }

  /// Method to set the volume and notify listeners.
  void setVolume(double volume) {
    getVolume = volume;
    notifyListeners();
  }

  /// Method to set the current playback time and notify listeners.
  void setCurrentTime(int currentTime) {
    getCurrentTime = currentTime;
    notifyListeners();
  }

  /// Method to set the total duration and notify listeners.
  void setDuration(int duration) {
    getDuration = duration;
    notifyListeners();
  }

  /// Method to set the video quality and notify listeners.
  void setQuality(VideoResolutionEnum quality) {
    getQuality = quality;
    notifyListeners();
  }

  /// Method to set the player state and notify listeners.
  void setState(PlayerStateEnum playerState) {
    getState = playerState;
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
