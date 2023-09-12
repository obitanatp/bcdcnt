import 'dart:math';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pj/app/services/local_storage.dart';
// import 'package:pj/presentation/controllers/audio_controller.dart';
import 'package:pj/presentation/controllers/song/song_controller.dart';

// ignore: must_be_immutable
class InitPage extends StatelessWidget {
  InitPage({super.key,});
  final store = Get.find<LocalStorageService>();
  final song = Get.find<SongController>();
  // final song = Get.put(AudioController());
  final scrollcontroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    // double bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return GetX(
      init: song,
      initState: (_) async{
        await song.fetch();
        scrollcontroller.addListener(_scrollListener);
        song.controller.stop();
        song.audioController.onDurationChanged.listen((dur) {
        song.duration.value = dur;
        song.update();
        });
        song.audioController.onPositionChanged.listen((pos) {
        song.position.value = pos;
        song.update();
        });
      },
      dispose: (_) {
        scrollcontroller.removeListener(_scrollListener);
        scrollcontroller.dispose();
        song.controller.dispose();
        song.dispose();
      },
      builder: (_) {
        return Scaffold(
      body: song.data.isEmpty ? Container(child: const Center(child: CircularProgressIndicator())) : Center(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.0,
                0.3,
                0.6,
                0.9,
              ],
              colors: [
                Colors.yellow,
                Colors.red,
                Colors.indigo,
                Colors.teal,
              ],
            )),
            child: Center(
              child: Stack(clipBehavior: Clip.none, children: [
                CustomScrollView(
                  controller: scrollcontroller,
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 420.0,
                      backgroundColor: Colors.white.withOpacity(0.5),
                      stretch: true,
                      actions: song.lastStatus.value
                          ? [
                              btnBackward(),
                              btnStart(),
                              btnForward(),
                            ]
                          : null,
                      leading: IconButton(
                        icon: const Icon(Icons.loop),
                        onPressed: () async{
                            song.data.value = [];
                            song.isPlaying.value = false;
                            song.isRepeat.value = false;
                            song.isShuffle.value = false;
                            song.currentPlay.value = 0;
                            song.controller.stop();
                            await song.fetch();
                        },
                      ),
                      flexibleSpace: Container(
                        child: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          stretchModes: const [
                            StretchMode.zoomBackground,
                            StretchMode.fadeTitle
                          ],
                          background: SafeArea(
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50.0, bottom: 20.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: RotationTransition(
                                        turns: song.controller,
                                        child: Image.network(
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.cover,
                                          song.data.isNotEmpty && song.data[song.currentPlay.value].song != null && song.data[song.currentPlay.value].song?.thumbnail != null && song.data[song.currentPlay.value].song?.thumbnail?.url != null ? '${song.data[song.currentPlay.value].song?.thumbnail?.url}' : "https://thumbs.dreamstime.com/z/error-page-not-found-vector-vinyl-music-broken-graphic-error-page-not-found-vector-vinyl-music-broken-graphic-background-156624909.jpg",
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            //do something
                                            return const Image(
                                              image: NetworkImage(
                                                "https://thumbs.dreamstime.com/z/error-page-not-found-vector-vinyl-music-broken-graphic-error-page-not-found-vector-vinyl-music-broken-graphic-background-156624909.jpg",
                                              ),
                                              height: 200,
                                              width: 200,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                        // Image(
                                        //   image: NetworkImage(
                                        //       "https://thumbs.dreamstime.com/z/error-page-not-found-vector-vinyl-music-broken-graphic-error-page-not-found-vector-vinyl-music-broken-graphic-background-156624909.jpg"),
                                        //   fit: BoxFit.cover,
                                        //   height: 200,
                                        //   width: 200,
                                        // ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      song.data.isNotEmpty && song.data[song.currentPlay.value].song != null && song.data[song.currentPlay.value].song?.title != null ? '${song.data[song.currentPlay.value].song?.title}' : "loading",
                                    ),
                                  ),
                                  GetBuilder<SongController>(
                                    init: song,
                                    builder: (_) =>
                                    Container(
                                      width: widthScreen,
                                      child: Column(children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [Sheffler(),Bar(),Repeater()],),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [Text(song.position.value
                                                 .toString()
                                                 .split(".")[0]),
                                                 bigbtnBackward(),
                                                 bigbtnStart(),
                                                 bigbtnForward(),
                                                 Text(song.duration.value
                                                 .toString()
                                                 .split(".")[0]),],)
                                    ]),)
                                  // Container(
                                  //     width: widthScreen,
                                  //     height: 100,
                                  //     child: Stack(
                                  //       children: [
                                  //         Sheffler(),
                                  //         Positioned(
                                  //           child: bigbtnBackward(),
                                  //           left: widthScreen / 5,
                                  //           bottom: -10,
                                  //         ),
                                  //         Positioned(
                                  //           child: bigbtnStart(),
                                  //           left: (widthScreen / 2) - 30,
                                  //           bottom: -10,
                                  //         ),
                                  //         Positioned(
                                  //           child: bigbtnForward(),
                                  //           right: widthScreen / 5,
                                  //           bottom: -10,
                                  //         ),
                                  //         Positioned(
                                  //           child: Repeater(),
                                  //           left: widthScreen - 60,
                                  //         ),
                                  //         Positioned(
                                  //           child: Bar(),
                                  //           bottom: 35,
                                  //           left: (widthScreen / 2) - 100,
                                  //         ),
                                  //         Positioned(
                                  //           child: Text(song.position.value
                                  //               .toString()
                                  //               .split(".")[0]),
                                  //           bottom: 20,
                                  //           left: 10,
                                  //         ),
                                  //         Positioned(
                                  //           child: Text(song.duration.value
                                  //               .toString()
                                  //               .split(".")[0]),
                                  //           bottom: 20,
                                  //           left: widthScreen - 60,
                                  //         ),
                                  //       ],
                                  //     )),
                                      )
                                ],
                              ),
                            ),
                          ),
                          centerTitle: false,
                          title: song.lastStatus.value
                              ? BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 5.0,
                                    sigmaY: 5.0,
                                  ),
                                  child: Container(child: Text(song.data.isNotEmpty && song.data[song.currentPlay.value].song != null && song.data[song.currentPlay.value].song?.title != null ? '${song.data[song.currentPlay.value].song?.title}' : "loading",overflow: TextOverflow.ellipsis,)))
                              : null,
                        ),
                      ),
                    ),
                    SliverFixedExtentList(
                      itemExtent: 75.0,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                              padding: const
                                  EdgeInsets.only(top: 5, left: 5, right: 5),
                              child: TextButton(
                                style: index == song.currentPlay.value
                                    ? ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red))
                                    : ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                onPressed: () => _loadSong(index),
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    // child: Text('$fetchAlbum(index)'),
                                    child: Text((song.data.isNotEmpty && song.data[index].song != null && song.data[index].song?.title != null) ? '${song.data[index].song?.title}' : "loading")),

                              ));
                        },
                        childCount: song.data.isNotEmpty ? song.data.length : 0,
                      ),
                    ),
                  ],
                ),
              ]),
            )),
      ),
    );
      }
    );
  }

    Widget btnStart() {
    return IconButton(
      icon: song.isPlaying.value
          ? const Icon(
              Icons.pause_circle_filled,
              color: Colors.red,
            )
          : const Icon(
              Icons.play_circle_filled,
              color: Colors.red,
            ),
      onPressed: () async {
        if (song.isPlaying.value) {
          await song.audioController.pause();
          song.controller.stop();
            song.isPlaying.value = false;
             song.update();
        } else {
          _loadSong(song.currentPlay.value);
          song.controller.forward();
          song.controller.addListener(() {
            if (song.controller.isCompleted) {
              song.controller.repeat();
            }
          });
            song.isPlaying.value = true;
            song.update();
        }
      },
    );
  }

  Widget btnBackward() {
    return IconButton(
      icon: song.isPlaying.value
          ? const Icon(Icons.skip_previous)
          : const Icon(Icons.skip_previous_outlined),
      onPressed: () {
        if (song.currentPlay.value != 0) {
          _loadSong(song.currentPlay.value - 1);
        } else {
          song.currentPlay.value = song.data.length-1;
          _loadSong(song.currentPlay.value);
        }
      },
    );
  }

  Widget btnForward() {
    return IconButton(
      icon: song.isPlaying.value ? const Icon(Icons.skip_next) : const Icon(Icons.skip_next_outlined),
      onPressed: () {
        if (song.currentPlay.value != song.data.length-1) {
          _loadSong(song.currentPlay.value + 1);
        } else {
          song.currentPlay.value = 0;
          _loadSong(song.currentPlay.value);
        }
      },
    );
  }

  Widget bigbtnStart() {
    return IconButton(
      iconSize: 50,
      icon: song.isPlaying.value
          ? const Icon(
              Icons.pause_circle_filled,
              color: Colors.red,
            )
          : const Icon(
              Icons.play_circle_filled,
              color: Colors.red,
            ),
      onPressed: () async {
        if (song.isPlaying.value) {
          await song.audioController.pause();
          song.controller.stop();
            song.isPlaying.value = false;
            song.update();
        } else {
          _loadSong(song.currentPlay.value);
          song.controller.forward();
          song.controller.addListener(() {
            if (song.controller.isCompleted) {
              song.controller.repeat();
            }
          });
            song.isPlaying.value = true;
            song.update();
        }
      },
    );
  }

  Widget bigbtnBackward() {
    return IconButton(
      iconSize: 50,
      icon: song.isPlaying.value
          ? const Icon(Icons.skip_previous)
          : const Icon(Icons.skip_previous_outlined),
      onPressed: () {
        if (song.currentPlay.value != 0) {
          _loadSong(song.currentPlay.value - 1);
        } else {
          song.currentPlay.value = song.data.length-1;
          _loadSong(song.currentPlay.value);
        }
      },
    );
  }

  Widget bigbtnForward() {
    return IconButton(
      iconSize: 50,
      icon: song.isPlaying.value ? const Icon(Icons.skip_next) : const Icon(Icons.skip_next_outlined),
      onPressed: () {
        if (song.currentPlay.value != song.data.length-1) {
          _loadSong(song.currentPlay.value + 1);
        } else {
          song.currentPlay.value = 0;
          _loadSong(song.currentPlay.value);
        }
      },
    );
  }

  Widget Repeater() {
    return IconButton(
      icon: song.isRepeat.value
          ? const Icon(
              Icons.repeat_rounded,
              color: Colors.red,
            )
          : const Icon(
              Icons.repeat_rounded,
              color: Colors.black,
            ),
      onPressed: () {
        if (song.isRepeat.value) {
            song.isRepeat.value = false;
            song.update();
        } else {
            song.isRepeat.value = true;
            song.update();
        }
      },
    );
  }

  Widget Sheffler() {
    return IconButton(
      icon: song.isShuffle.value
          ? const Icon(Icons.shuffle, color: Colors.red)
          : const Icon(Icons.shuffle, color: Colors.black),
      onPressed: () {
        if (song.isShuffle.value) {
            song.isShuffle.value = false;
            song.update();
        } else {
            song.isShuffle.value = true;
            song.update();
        }
      },
    );
  }

  Widget Bar() {
    return Slider(
        activeColor: Colors.red,
        inactiveColor: Colors.black,
        value: song.position.value.inSeconds.toDouble(),
        min: 0.0,
        max: song.duration.value.inSeconds.toDouble(),
        onChanged: (double value) {
            changeToSecond(value.toInt());
            value = value;
        });
  }

  void _animatelisten() {
    if (song.isPlaying.value) {
      song.controller.stop();
      song.isPlaying.value = false;
    } else {
      song.controller.forward();
      song.controller.addListener(() {
        if (song.controller.isCompleted) {
          song.controller.repeat();
        }
      });
      song.isPlaying.value = true;
    }
    song.update();
  }

  void _scrollListener() {
    if ((scrollcontroller.hasClients &&
        scrollcontroller.offset > (song.height.value)) != song.lastStatus.value) {
        song.lastStatus.value = (scrollcontroller.hasClients &&
        scrollcontroller.offset > (song.height.value));
        song.update();
    }
  }

  void _loadSong(index) async {
    song.currentPlay.value = index;
    if (!song.isPlaying.value) {
      song.controller.forward();
      song.controller.addListener(() {
        if (song.controller.isCompleted) {
          song.controller.repeat();
        }
      });
        song.isPlaying.value = true;
      await song.audioController.play(UrlSource('${song.data[song.currentPlay.value].song?.file?.audio_url}'));
      song.audioController.onPlayerComplete.listen((event) {
        if (song.isRepeat.value) {
          _loadSong(song.currentPlay.value);
        }
        if (!song.isRepeat.value && song.isShuffle.value) {
          Random random = Random();
          int i = song.currentPlay.value + random.nextInt(song.data.length);

          _loadSong(i % song.data.length);
        }
        if (!song.isRepeat.value && !song.isShuffle.value) {
          if (song.currentPlay.value == song.data.length-1) {
            _loadSong(0);
          } else {
            _loadSong(song.currentPlay.value + 1);
          }
        }
      });
    } else {
      await song.audioController.stop();
      await song.audioController.play(UrlSource('${song.data[song.currentPlay.value].song?.file?.audio_url}'));
      song.audioController.onPlayerComplete.listen((event) {
        if (song.isRepeat.value) {
          _loadSong(song.currentPlay.value);
        }
        if (!song.isRepeat.value && song.isShuffle.value) {
          Random random = Random();
          int i = song.currentPlay.value + random.nextInt(song.data.length);

          _loadSong(i % song.data.length);
        }
        if (!song.isRepeat.value && !song.isShuffle.value) {
          if (song.currentPlay.value == song.data.length-1) {
            _loadSong(0);
          } else {
            _loadSong(song.currentPlay.value + 1);
          }
        }
      });
    }
    song.update();
  }

    void changeToSecond(int sec) {
    Duration newDur = Duration(seconds: sec);
    song.audioController.seek(newDur);
     song.update();
  }
}
