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


## [1.0.0] - Stable Release

### Added
- Initial stable release of the `vk_video` package.
- Introduced `VKVideo` widget for seamless integration of VK video in Flutter applications.
- Developed `VKVideoController` for effective management of video playback state.
- Integrated `InAppWebView` for rendering the VK player with customizable settings for flexibility.
- Created extension methods to convert strings to `PlayerStateEnum` and `VideoResolutionEnum` for enhanced usability.

### Changed
- Established a consistent and intuitive interface for video control methods (play, pause, seek, etc.) to improve developer experience.
- Implemented a timer for periodic state checks, ensuring that the UI remains synchronized with the video playback effectively.

### Fixed
- Resolved issues related to video playback initialization and user gesture requirements, enhancing reliability.
- Improved error handling mechanisms for unsupported video resolutions and states, ensuring a more robust user experience.

### Notes
- This version represents a stable release following thorough testing and feedback.
- Future updates will focus on additional features and optimizations based on user input.