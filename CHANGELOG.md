# Changelog for vk_video

## [0.0.1]
### Added
- Initial release of the `vk_video` package.
- Added `VKVideo` widget for embedding VK video in Flutter applications.
- Implemented `VKVideoController` for managing video playback state.
- Integrated InAppWebView for rendering the VK player with customizable settings.
- Created extension methods for converting strings to `PlayerStateEnum` and `VideoResolutionEnum`.

### Changed
- Established a consistent interface for video control methods (play, pause, seek, etc.).
- Included a timer for periodic state checks to ensure UI synchronization with the video player.

### Fixed
- Fixed issues with video playback initialization and user gesture requirements.
- Improved error handling for unsupported video resolutions and states.