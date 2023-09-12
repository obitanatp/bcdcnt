import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pj/domain/entities/song.dart';
import 'package:pj/domain/usecases/song_use_case.dart';

class SongController extends GetxController with GetSingleTickerProviderStateMixin {
  SongController(this.songUseCase);
   late AudioPlayer audioController;
    late AnimationController controller;
    var duration = Rx<Duration>(const Duration());
    var position = Rx<Duration>(const Duration());
    final currentPlay = 0.obs;
    final isPlaying = false.obs;
    final isRepeat = false.obs;
    final isShuffle = false.obs;
    final lastStatus = false.obs;
    var height = Rx<double>(370);
  final SongUseCase songUseCase;
  var data = RxList<Song>([]);
  var track = RxList<int>([]);

  void onInit() async {
    audioController = AudioPlayer();
    controller = AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this
        )..repeat(reverse: false);
    controller.stop();    
    super.onInit();
  } 
  
  getSong(int id) async{
      final res = await songUseCase.execute(id);
      if(res.data != null && res.data?.song != null){
        data.add(res.data!);
      }
  }

  fetch() async {
    track.value = [];
    data.value = [];
    while (track.length < 20) {
      Random rand = Random();
      var value = rand.nextInt(8500);
      if (track.indexOf(value) == -1) {
        track.add(value);
      }
    }
    for(int i=0;i<20;i++){
      await getSong(track[i]);
    }
    update();
  }
}
