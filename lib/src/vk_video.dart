import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:vk_video/vk_video.dart';

class VKVideo extends StatefulWidget {
  const VKVideo({
    super.key,
    this.height,
    this.controller,
    this.initialWidget,
    this.backgroundColor,
    this.videoResolutionEnum,
    this.isAutoPlay,
    required this.videoOId,
    required this.videoId,
    this.videoStartTime,
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
                    .replaceAll("%HD%", (widget.videoResolutionEnum?.index ?? _playerController!.getQuality.index).toString())
                    .replaceAll("%AUTO_PLAY%", widget.isAutoPlay ?? _playerController!.isAutoPlay ? "1" : "0")
                    .replaceAll("%T%", (widget.videoStartTime ?? _playerController!.videoStartTime).toFormattedString()),
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
      _videoPlayerHandler?.triggerCurrentTime();
      _videoPlayerHandler?.triggerDuration();
      _videoPlayerHandler?.triggerQuality();
      _videoPlayerHandler?.triggerVolume();
      _videoPlayerHandler?.triggerState();
      _videoPlayerHandler?.triggerIsMuted();
    });
  }
}