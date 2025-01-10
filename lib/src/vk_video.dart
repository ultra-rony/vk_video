import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:vk_video/vk_video.dart';

class VKVideo extends StatefulWidget {
  const VKVideo({
    super.key,

    /// Optional parameter for specifying the height of the video player.
    this.height,

    /// Optional custom controller for the player.
    /// A custom controller allows for more granular control of the video playback.
    this.controller,

    /// Optional widget to be displayed while the video is loading or if there is an error.
    this.initialWidget,

    /// Optional parameter to specify the background color of the video player.
    this.backgroundColor,

    /// Optional parameter for setting the initial video resolution.
    this.videoResolutionEnum,

    /// Optional flag to determine if the video should start playing automatically.
    this.isAutoPlay,

    /// Required parameter for the video ID (object ID), essential for identifying the video.
    required this.videoOId,

    /// Required parameter for the unique identifier of the video.
    required this.videoId,

    /// Optional parameter to specify the start time of the video.
    this.videoStartTime,

    /// Allow fullscreen for iframe.
    /// A flag that indicates whether fullscreen mode is allowed for iframes.
    this.isIframeAllowFullscreen = false,

    /// Allow inline playback.
    /// A flag indicating if the video can be played inline instead of fullscreen on mobile devices.
    this.isAllowsInlineMediaPlayback = true,
  });

  /// Height of the video container
  final double? height;

  /// Controller for video playback
  final VKVideoController? controller;

  /// Initial widget shown while loading
  final Widget? initialWidget;

  /// Background color of the video container
  final Color? backgroundColor;

  /// Selected video resolution
  final VideoResolutionEnum? videoResolutionEnum;

  /// Flag for autoplaying the video
  final bool? isAutoPlay;

  /// The object ID of the video
  final String videoOId;

  /// The video ID
  final String videoId;

  /// The desired start time for the video
  final Duration? videoStartTime;

  /// Indicates if fullscreen is allowed.
  final bool isIframeAllowFullscreen;

  /// Indicates if inline playback is allowed.
  final bool isAllowsInlineMediaPlayback;

  @override
  State<VKVideo> createState() => _VKVideoState();
}

class _VKVideoState extends State<VKVideo> with AutomaticKeepAliveClientMixin {
  /// Timer to periodically check the state of the video.
  Timer? _stateCheckTimer;

  /// Controller for video playback state.
  VKVideoController? _playerController;

  VideoPlayerHandler? _videoPlayerHandler;

  /// Keeps the state of this widget alive when navigating
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    /// Initialize controller
    _playerController = widget.controller ?? VKVideoController();
  }

  @override
  void dispose() {
    /// Cancel the timer when disposing
    _stateCheckTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      /// Default height if not provided
      height: widget.height ?? 300,

      /// Default black background
      color: widget.backgroundColor ?? const Color(0xFF000000),
      child: Stack(
        children: [
          Center(
            /// Show loading indicator
            child: widget.initialWidget ??
                CircularProgressIndicator(color: Color(0xFFFFFFFF)),
          ),
          Positioned.fill(
            child: InAppWebView(
              initialSettings: InAppWebViewSettings(
                /// Allow fullscreen mode.
                iframeAllowFullscreen: false,

                /// Allow inline playback.
                allowsInlineMediaPlayback: true,

                /// Media playback doesn't require user gesture
                mediaPlaybackRequiresUserGesture: false,

                /// Set a transparent background for the WebView.
                transparentBackground: true,
              ),
              initialData: InAppWebViewInitialData(
                /// Load the video player HTML, replacing placeholders with actual values.
                data: Template.html
                    .replaceAll("%OID%", widget.videoOId)
                    .replaceAll("%ID%", widget.videoId)
                    .replaceAll(
                        "%HD%",
                        (widget.videoResolutionEnum?.index ??
                                _playerController!.getQuality.index)
                            .toString())
                    .replaceAll(
                        "%AUTO_PLAY%",
                        widget.isAutoPlay ?? _playerController!.isAutoPlay
                            ? "1"
                            : "0")
                    .replaceAll(
                        "%T%",
                        (widget.videoStartTime ??
                                _playerController!.videoStartTime)
                            .toFormattedString()),
                mimeType: 'text/html',
                encoding: 'utf-8',
              ),
              onWebViewCreated: (controller) {
                /// Assign the WebView controller
                _videoPlayerHandler = VideoPlayerHandler(
                  inAppWebViewController: controller,
                  vkVideoController: _playerController,
                );
              },
              onLoadStop: (controller, url) async {
                /// Start timer when loading stops
                _startVideoStateCheckTimer();
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Start a timer to check the state of the video every second.
  _startVideoStateCheckTimer() {
    _stateCheckTimer = Timer.periodic(const Duration(seconds: 1), (res) async {
      /// Trigger state checks on the video player
      /// Call the method to retrieve the current playback time of the video.
      _videoPlayerHandler?.triggerCurrentTime();

      /// Call the method to retrieve the total duration of the video.
      _videoPlayerHandler?.triggerDuration();

      /// Call the method to retrieve the current video quality/resolution settings.
      _videoPlayerHandler?.triggerQuality();

      /// Call the method to retrieve the current volume level of the player.
      _videoPlayerHandler?.triggerVolume();

      /// Call the method to check the current state of the video player (e.g., playing, paused).
      _videoPlayerHandler?.triggerState();

      /// Call the method to check if the video is currently muted.
      _videoPlayerHandler?.triggerIsMuted();

      /// Notify the player controller that the state has changed, allowing listeners to react.
      _playerController?.setState();
    });
  }
}
