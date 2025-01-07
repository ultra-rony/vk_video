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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

  @override
  void initState() {
    _controller = VKVideoController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            VKVideo(
              controller: _controller,
              videoOId: '-22822305',
              videoId: '456241864',
              isAutoPlay: false,
              videoResolutionEnum: VideoResolutionEnum.p480,
            ),
            TextButton(
              onPressed: () {
                _controller?.onPlay.call();
              },
              child: Text("play"),
            ),
            TextButton(
              onPressed: () {
                _controller?.onPause.call();
              },
              child: Text("pause"),
            ),
          ],
        ),
      ),
    );
  }
}
