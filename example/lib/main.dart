import 'package:flutter/material.dart';
import 'package:vk_video/vk_video.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VK Video Player',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const VideoPage(),
    );
  }
}

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VKVideoController _controller;

  bool _isPlaying = false;
  bool _isMuted = false;
  int _current = 0;
  int _duration = 0;

  @override
  void initState() {
    super.initState();

    _controller = VKVideoController();
    _controller.addListener(_videoListener);
  }

  void _videoListener() {
    if (!mounted) return;

    setState(() {
      _current = _controller.getCurrentTime ?? 0;
      _duration = _controller.getDuration ?? 0;
      _isMuted = (_controller.getVolume ?? 100) == 0;
      _isPlaying = _controller.getPlayerState.toString().contains('playing');
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    super.dispose();
  }

  String formatTime(int seconds) {
    final duration = Duration(seconds: seconds);

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final secs = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${secs.toString().padLeft(2, '0')}';
    }

    return '${minutes.toString().padLeft(2, '0')}:'
        '${secs.toString().padLeft(2, '0')}';
  }

  void _seek(int seconds) {
    final newPosition = (_current + seconds).clamp(0, _duration).toInt();

    _controller.onSeekTo(
      Duration(seconds: newPosition),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = _duration == 0 ? 0.0 : _current / _duration;

    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'VK Video Player',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// VIDEO CARD
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: .25),
                      blurRadius: 30,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VKVideo(
                    controller: _controller,
                    videoOId: '-213200306',
                    videoId: '456239020',
                    isAutoPlay: true,
                    videoResolutionEnum: VideoResolutionEnum.p480,
                    videoStartTime: const Duration(seconds: 3),
                    backgroundColor: Colors.black,
                    initialWidget: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// TIME
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatTime(_current),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    formatTime(_duration),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              /// PROGRESS
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  minHeight: 6,
                  value: progress,
                ),
              ),

              const SizedBox(height: 30),

              /// CONTROLS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _controlButton(
                    icon: Icons.replay_10,
                    onTap: () => _seek(-10),
                  ),
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: 0.5),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (_isPlaying) {
                          _controller.onPause();
                        } else {
                          _controller.onPlay();
                        }
                      },
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _controlButton(
                    icon: Icons.forward_10,
                    onTap: () => _seek(10),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// EXTRA BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_isMuted) {
                        _controller.onUnMute();
                      } else {
                        _controller.onMute();
                      }
                    },
                    icon: Icon(
                      _isMuted ? Icons.volume_off : Icons.volume_up,
                    ),
                    label: Text(
                      _isMuted ? 'Включить звук' : 'Выключить звук',
                    ),
                  ),
                ],
              ),

              const Spacer(),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _infoRow(
                        'Текущее время',
                        formatTime(_current),
                      ),
                      _infoRow(
                        'Длительность',
                        formatTime(_duration),
                      ),
                      _infoRow(
                        'Громкость',
                        '${_controller.getVolume ?? 0}%',
                      ),
                      _infoRow(
                        'Качество',
                        _controller.getQuality.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _controlButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(18),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 30,
        ),
      ),
    );
  }

  Widget _infoRow(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
