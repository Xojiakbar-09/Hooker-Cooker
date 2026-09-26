import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Video extends StatefulWidget {
  final dynamic model;
  const Video({super.key, required this.model});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  void _initVideoPlayer() async {
    final String? videoPath = widget.model?.video;

    if (videoPath == null || videoPath.isEmpty) {
      setState(() {
        _hasError = true;
      });
      return;
    }

    try {
      if (videoPath.startsWith('http://') || videoPath.startsWith('https://')) {
        _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoPath));
      } else {
        _videoPlayerController = VideoPlayerController.file(File(videoPath));
      }

      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              "Videoni ochishda xatolik: $errorMessage",
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
        },
      );

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.model?.nomi ?? "Video"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: _hasError
            ? const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Bu taom uchun video mavjud emas yoki havola noto'g'ri!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : _isInitialized && _chewieController != null
                ? Chewie(controller: _chewieController!)
                : const CircularProgressIndicator(),
      ),
    );
  }
}