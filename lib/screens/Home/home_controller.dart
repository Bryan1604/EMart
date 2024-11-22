import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  var currentnNavIndex = 0.obs;
  final currentPosition = const Offset(50, 50).obs;
  late final VideoPlayerController videoController1;
  late final VideoPlayerController videoController2;
  var chewieController = <ChewieController?>[null, null].obs;
  // ChewieController? chewieController;

  @override
  void onInit() {
    super.onInit();
    videoController1 = VideoPlayerController.asset('assets/videos/video1.mp4')
      ..initialize().then((_) {
        chewieController = ChewieController(
          videoPlayerController: videoController1,
          autoPlay: true,
          looping: true,
        ) as RxList<ChewieController?>;
        update();
      });

    videoController2 = VideoPlayerController.asset('assets/videos/video1.mp4')
      ..initialize().then((_) {
        chewieController = ChewieController(
          videoPlayerController: videoController2,
          autoPlay: true,
          looping: true,
        ) as RxList<ChewieController?>;
        update();
      });
  }

  @override
  void onClose() {
    videoController1.dispose();
    videoController2.dispose();
    // chewieController.dispose();
    super.onClose();
  }
}

class VideoController extends GetxController {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  @override
  void onInit() {
    super.onInit();
    _videoController = VideoPlayerController.asset('assets/videos/video1.mp4')
      ..initialize().then((_) {
        _chewieController = ChewieController(
          videoPlayerController: _videoController,
          autoPlay: true,
          looping: true,
        );
        update();
      });
  }

  @override
  void onClose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.onClose();
  }
}
