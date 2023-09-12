// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:audioplayers/audioplayers.dart';

// class AudioController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//      late AudioPlayer audioController;
//     late AnimationController controller;
//     late Duration duration;
//     late Duration position;
//     final currentPlay = 0.obs;
//     final isPlaying = false.obs;
//     final isRepeat = false.obs;
//     final isShuffle = false.obs;
//     final lastStatus = true.obs;
//     var height = Rx<double>(370);

//   void onInit() async {
//     duration = Duration();
//     position = Duration();
//     audioController = AudioPlayer();
//     controller = AnimationController(
//         duration: const Duration(seconds: 5),
//         vsync: this
//         )..repeat(reverse: false);
//     super.onInit();
//   }     
// }