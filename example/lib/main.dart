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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'vk_video Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VKVideoController? _controller;

  int currentTime = 0;
  bool isMute = false;

  @override
  void initState() {
    _controller = VKVideoController();
    super.initState();
    _controller?.addListener(_videoListener);
  }

  _videoListener() async {
    debugPrint("position: ${_controller!.getCurrentTime}");
    debugPrint("currentTime: $currentTime");
    debugPrint("isMute: $isMute");
    debugPrint("duration: ${_controller?.getDuration}");
    debugPrint("volume: ${_controller?.getVolume}");
    debugPrint("quality: ${_controller?.getQuality}");
    debugPrint("player state: ${_controller?.getPlayerState}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
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
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _controller?.onPlay();
                    },
                    child: Icon(Icons.play_arrow, size: 35),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller?.onPause();
                    },
                    child: Icon(Icons.pause_outlined, size: 35),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller?.onSeekTo(
                          Duration(seconds: _controller!.getCurrentTime!) -
                              Duration(seconds: 5));
                    },
                    child: Icon(Icons.skip_previous, size: 35),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller?.onSeekTo(
                          Duration(seconds: _controller!.getCurrentTime!) +
                              Duration(seconds: 5));
                    },
                    child: Icon(Icons.skip_next, size: 35),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller?.onUnMute();
                    },
                    child: Icon(Icons.volume_up, size: 35),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller?.onMute();
                    },
                    child: Icon(Icons.volume_off, size: 35),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
