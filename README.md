<p align="center">
    <img src="https://github.com/ultra-rony/vk_video/blob/developer/screenshots/logo.png?raw=true" height="200" alt="vk_video" />
</p>

<p align="center">
    <a href="https://pub.dev/packages/vk_video"><img src="https://img.shields.io/badge/pub-v1.0.4-blue" alt="Pub"></a>
    <a href="https://github.com/ultra-rony/vk_video/releases"><img src="https://img.shields.io/badge/download-apk-blue" alt="apk"></a>
    <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
    <a href="https://pub.dev/packages/vk_video/score"><img src="https://img.shields.io/badge/points-160/160-green" alt="Points"></a>
    <a href="https://www.donationalerts.com/r/ultra_rony"><img src="https://img.shields.io/badge/support-donate-yellow" alt="Donate"></a>
    <a href="https://pub.dev/packages/flutter_inappwebview"><img src="https://img.shields.io/badge/flutter_inappwebview-v6.1.5-blue" alt="Inappwebview"></a>
</p>

---
# vk_video
<p>
    The vk_video package simplifies the integration of VK video playback into your Flutter apps. It supports the VK Video API, allowing easy embedding and control for a seamless media experience.<br>
    <span style="font-size: 0.9em"> Please star the <a href="https://github.com/ultra-rony/vk_video">repository</a> to support the project! </span>
</p>

## Getting Started

To use this package, add it to your `pubspec.yaml`:

```yaml
dependencies:
  vk_video: ^1.0.4
```

or run the command

```bash
flutter pub add vk_video
```

## Using the player

import

```dart
import 'package:vk_video/vk_video.dart';
```

Full screen disable mode

```dart
VKVideo(
    videoOId: '-22822305',
    videoId: '456241864',
),
```

Full screen mode

```dart
VKVideo(
    videoOId: '-213200306',
    videoId: '456239020',
    isIframeAllowFullscreen: true,
    isAllowsInlineMediaPlayback: false,
),
```

To add the permission for internet access in your Android app, you need to include it in your AndroidManifest.xml file. Here’s how to do that:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

Controller

```dart
VKVideoController? _controller;

@override
void initState() {
    _controller = VKVideoController();
    super.initState();
}

VKVideo(
    controller: _controller,
    videoOId: '-213200306',
    videoId: '456239020',
    isAutoPlay: true,
    videoResolutionEnum: VideoResolutionEnum.p480,
    videoStartTime: Duration(seconds: 3),
    backgroundColor: const Color(0xFF000000),
    initialWidget: Text(
        "Loading....",
        style: TextStyle(
          color: Color(0xFFFFFFFF),
        ),
    ),
),
```

Add a listener to track changes in video playback position

```dart
_controller?.addListener(() {
    debugPrint("position: ${_controller!.getCurrentTime}");
    debugPrint("currentTime: $currentTime");
    debugPrint("isMute: $isMute");
    debugPrint("duration: ${_controller?.getDuration}");
    debugPrint("volume: ${_controller?.getVolume}");
    debugPrint("quality: ${_controller?.getQuality}");
    debugPrint("player state: ${_controller?.getPlayerState}");
  };
);
```

Button to seek forward 5 seconds in the video

```dart
_controller?.onSeekTo(Duration(seconds: _controller!.getCurrentTime!) + Duration(seconds: 5));
```

## Examples

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <img src="https://github.com/ultra-rony/vk_video/blob/developer/screenshots/image-10-01-25-07-57.png?raw=true" width="600" alt=""/>
            </td>
        </tr>
    </table>
</div>

