<p align="center">
    <img src="https://github.com/ultra-rony/vk_video/blob/developer/screenshots/logo.png" height="200" alt="youtube_web_player" />
</p>

<p align="center">
    <a href="https://pub.dev/packages/vk_video"><img src="https://img.shields.io/badge/pub-v1.0.0-blue" alt="Pub"></a>
    <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
    <a href="https://pub.dev/packages/vk_video/score"><img src="https://img.shields.io/badge/points-160/160-green" alt="Points"></a>
    <a href="https://www.donationalerts.com/r/ultra_rony"><img src="https://img.shields.io/badge/support-donate-yellow" alt="Donate"></a>
    <a href="https://pub.dev/packages/flutter_inappwebview"><img src="https://img.shields.io/badge/flutter_inappwebview-v6.1.5-blue" alt="Inappwebview"></a>
</p>

---

### vk_video
<p align="center">
    The vk_video package simplifies the integration of VK video playback into your Flutter apps. It supports the VK Video API, allowing easy embedding and control for a seamless media experience.<br>
   <span style="font-size: 0.9em"> Show some ❤️ and <a href="https://github.com/ultra-rony/youtube_web_player">star the repo</a> to support the project! </span>
</p>

## Getting Started

To use this package, add it to your `pubspec.yaml`:

```yaml
dependencies:
  vk_video: ^0.0.1
```

or run the command

```bash
flutter pub add vk_video
```

## Using the player

import

```dart
import 'package:youtube_web_player/youtube_web_player.dart';
```

```dart
VKVideo(
    controller: _controller,
    videoOId: '-22822305',
    videoId: '456241864',
    isAutoPlay: false,
    videoResolutionEnum: VideoResolutionEnum.p480,
),
```

To add the permission for internet access in your Android app, you need to include it in your AndroidManifest.xml file. Here’s how to do that:

```xml
<uses-permission android:name="android.permission.INTERNET"/>