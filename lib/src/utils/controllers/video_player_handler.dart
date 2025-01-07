import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:vk_video/vk_video.dart';

/// Class to handle interactions between the video player and the InAppWebView controller.
class VideoPlayerHandler {
  VideoPlayerHandler({
    required this.inAppWebViewController,
    required this.vkVideoController,
  }) {
    /// Set the methods for the VK Video Controller
    vkVideoController?.setMethods(
      onPause: pause,
      onPlay: play,
      onSeekTo: seekTo,
      onSeekLive: seekLive,
      onSetVolume: setVolume,
      triggerVolume: triggerVolume,
      triggerCurrentTime: triggerCurrentTime,
      triggerDuration: triggerDuration,
      triggerQuality: triggerQuality,
      onMute: mute,
      onUnMute: unmute,
      triggerIsMuted: triggerIsMuted,
      triggerState: triggerState,
    );
  }

  /// InAppWebView controller instance
  final InAppWebViewController? inAppWebViewController;
  /// VK Video Controller instance
  final VKVideoController? vkVideoController;

  /// Pauses the video playback by calling the JavaScript method in the web view.
  void pause() {
    inAppWebViewController?.evaluateJavascript(source: "player.pause()");
  }

  /// Starts or resumes video playback by calling the JavaScript method in the web view.
  void play() {
    inAppWebViewController?.evaluateJavascript(source: "player.play()");
  }

  /// Seeks to a specific duration in the video by calling the JavaScript method in the web view.
  void seekTo(Duration duration) {
    inAppWebViewController?.evaluateJavascript(
        source: "player.seek(${duration.inSeconds.toInt()})");
  }

  /// Seeks to the live point in the video by calling the JavaScript method in the web view.
  void seekLive() {
    inAppWebViewController?.evaluateJavascript(source: "player.seekLive()");
  }

  /// Sets the video volume by calling the JavaScript method in the web view.
  void setVolume(int volume) {
    inAppWebViewController?.evaluateJavascript(
        source: "player.setVolume($volume)");
  }

  /// Triggers and retrieves the current volume level from the web view.
  void triggerVolume() async {
    final volume = await inAppWebViewController?.evaluateJavascript(source: "player.getVolume()");
    vkVideoController?.setVolume(volume);
  }

  /// Triggers and retrieves the current playback time from the web view.
  void triggerCurrentTime() async {
    final currentTime = await inAppWebViewController?.evaluateJavascript(
        source: "player.getCurrentTime()");
    vkVideoController?.setCurrentTime((currentTime ?? 0).round());
  }

  /// Triggers and retrieves the total duration of the video from the web view.
  void triggerDuration() async {
    final duration = await inAppWebViewController?.evaluateJavascript(source: "player.getDuration()");
    vkVideoController?.setDuration((duration ?? 0).round());
  }

  /// Triggers and retrieves the current video quality/resolution from the web view.
  void triggerQuality() async {
    await inAppWebViewController?.evaluateJavascript(source: "player.getQuality()").then((value) async {
      vkVideoController?.setQuality(value.toString().toVideoResolutionPosition());
    });
  }

  /// Mutes the audio by calling the JavaScript method in the web view.
  void mute() {
    inAppWebViewController?.evaluateJavascript(source: "player.mute()");
  }

  /// Unmutes the audio by calling the JavaScript method in the web view.
  void unmute() {
    inAppWebViewController?.evaluateJavascript(source: "player.unmute()");
  }

  /// Triggers and retrieves whether the audio is muted from the web view.
  void triggerIsMuted() async {
    await inAppWebViewController?.evaluateJavascript(source: "player.isMuted()").then((value) {
      vkVideoController?.setIsMuted(value);
    });
  }

  /// Triggers and retrieves the current state of the player from the web view.
  void triggerState() async {
    await inAppWebViewController?.evaluateJavascript(source: "player.getState()").then((value) {
      vkVideoController?.setState(value.toString().toPlayerStateEnum());
    });
  }
}