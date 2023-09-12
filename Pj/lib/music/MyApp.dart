// import 'dart:math';
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:pj/main.dart';
// import 'package:pj/music/State.dart';
// import 'package:http/http.dart' as http;
// import 'package:pj/music/Album.dart';
// import 'dart:ui';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Music Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHome(),
//     );
//   }
// }

// Future<Data> fetchPhotos(id) async {
//   Map<String, dynamic> queryParams = {
//     'query': 'query(\$id: ID!) {\n song(id: \$id) {\nid\ntitle\nsubtitle\nslug\ncontent\nviews\ndownloads\nfile_type\nlyric_type\nstatus\nyear\nrecord_year\nallow_comment\ncreated_at\nartists(first: 10, orderBy: [{column: "song_artist.order", order: ASC}]) {\ndata {\nid\ntitle\nslug\navatar {\nurl\n}\n}\n}\ncomposers(first: 10, orderBy: [{column: "song_composer.order", order: ASC}]) { \n data { \n id\n title\n slug\n }\n }\n poets(first: 10) {\n data {\nid\n  title\n slug\n  }\n }\n thumbnail {\n url\n user {\n id\n username\navatar {\nurl\n}\n}\n}\nfile {\nvideo_url\naudio_url\n }\n uploader {\n id\n username\n avatar {\nurl\n}\n}\ndocuments(first: 10) {\ndata {\nid\ntitle\nslug\nthumbnail {\n url\n}\n}\n}\n}\n}',
//     'variables': '{ "id" : "$id" }',
//   };
//   final response = await http.get(
//     Uri.https('api2.bcdcnt.net', '/graphql', queryParams),
//     headers: {"Content-Type": "application/json"},
//   );
//   if (response.statusCode == 200 && response.body.length > 0) {
//     print(response.body);
//     return Data.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

// // Future<String> fetchAlbum(id) async {
// //   Map<String, dynamic> queryParams = {
// //     'query': 'query(\$id: ID!) {\n song(id: \$id) {\nid\ntitle\nsubtitle\nslug\ncontent\nviews\ndownloads\nfile_type\nlyric_type\nstatus\nyear\nrecord_year\nallow_comment\ncreated_at\nartists(first: 10, orderBy: [{column: "song_artist.order", order: ASC}]) {\ndata {\nid\ntitle\nslug\navatar {\nurl\n}\n}\n}\ncomposers(first: 10, orderBy: [{column: "song_composer.order", order: ASC}]) { \n data { \n id\n title\n slug\n }\n }\n poets(first: 10) {\n data {\nid\n  title\n slug\n  }\n }\n thumbnail {\n url\n user {\n id\n username\navatar {\nurl\n}\n}\n}\nfile {\nvideo_url\naudio_url\n }\n uploader {\n id\n username\n avatar {\nurl\n}\n}\ndocuments(first: 10) {\ndata {\nid\ntitle\nslug\nthumbnail {\n url\n}\n}\n}\n}\n}',
// //     'variables': '{ id : $id, }',
// //   };
// //   final response = await http.get(
// //     Uri.https('https://api2.bcdcnt.net', '/graphql', queryParams),
// //     headers: {"Content-Type": "application/json"},
// //   );
// //   if (response.statusCode == 200) {
// //     return response.body;
// //   } else {
// //     throw Exception('Failed to load album');
// //   }
// // }

// class MyHomePage extends State<MyHome> with TickerProviderStateMixin {
//   List track = [];
//   int amount = 20;
//   List<Data> data = [];
//   // List<Album> albums = [
//   //   Album(
//   //       name: "TRĂNG TÂY HỒ",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/48/50/56/4850569d03167e4acba93cb1286f087d.mp3"),
//   //   Album(
//   //       name: "NGÀY EM ĐẾN",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/ac/eb/a8/aceba8804a644137938451714b017a92.mp3"),
//   //   Album(
//   //       name: "Huyền thoại mẹ",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/00/28/26/00282663349c9f81893303fc8cfaf320.mp3"),
//   //   Album(
//   //       name: "Tiếng hát thanh xuân trên đồng cỏ",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/f4/bf/f4/f4bff415802d0dbddfca5f03b5d8412c.mp3"),
//   //   Album(
//   //       name: "Ngày mùa",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/fd/e7/5a/fde75aa37b36d33853b07779ccdf0163.mp3"),
//   //   Album(
//   //       name: "Mượn",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/ae/bc/e2/aebce2ae87f9ae58ae143f643345e2a9.mp3"),
//   //   Album(
//   //       name: "Gọi người yêu dấu",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/1f/84/c0/1f84c0916b1dc8d91868f7013ee63025.mp3"),
//   //   Album(
//   //       name: "Quê hương ngày mới",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/95/3b/0f/953b0fce4bf506779cba871d27cee4c9.mp3"),
//   //   Album(
//   //       name: "Thơ tình của núi",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/04/44/77/044477af02471d3b4d2f48a0d2d785cf.mp3"),
//   //   Album(
//   //       name: "Mùa Xuân lên đường",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/64/72/52/64725226237ee66cf1ebe66cc80a9411.mp3"),
//   //   Album(
//   //       name: "Bác đang cùng chúng cháu hành quân",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/b7/94/b6/b794b666f0ca96df1f23f042d4a4a1e0.mp3"),
//   //   Album(
//   //       name: "Bóng cây Kơ Nia",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/0f/c4/17/0fc4175fd3c587ec965411bcd3b7747f.mp3"),
//   //   Album(
//   //       name: "Xôn xang mênh mang cao nguyên Đắk Lăk",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/82/cd/0e/82cd0efad9d1cf7672787a5fd8380fae.mp3"),
//   //   Album(
//   //       name: "Những lá thuyền ước mơ",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/73/06/2e/73062e18bf06c507c94a851877493b80.mp3"),
//   //   Album(
//   //       name: "Con kênh ta đào",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/97/99/78/9799788044c9f71f58a1015fb125af95.mp3"),
//   //   Album(
//   //       name: "Sao em nỡ vội lấy chồng",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/4f/46/88/4f468835ff770551e5ccf660370017fa.mp3"),
//   //   Album(
//   //       name: "Cuộc đời tươi hồng",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/0a/96/b4/0a96b4ee55cadcdcbbc54dfcf433334d.mp3"),
//   //   Album(
//   //       name: "Nha Trang thu",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/24/ba/f4/24baf4c179204a49df48cd2a5c25b0c8.mp3"),
//   //   Album(
//   //       name: "Huyền thoại mẹ",
//   //       url:
//   //           "https://cloud1.bcdcnt.net/00/28/26/00282663349c9f81893303fc8cfaf320.mp3"),
//   // ];
//   Duration _duration = new Duration();
//   Duration _position = new Duration();
//   ScrollController? _scrollcontroller;
//   late AudioPlayer audioPlayer;
//   int currentPlay = 0;
//   bool _isPlaying = false;
//   bool _isRepeat = false;
//   bool _isShuffle = false;
//   bool lastStatus = true;
//   double height = 370;
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 5),
//     vsync: this,
//   )..repeat(reverse: false);
//   // late final Animation<double> _animation = CurvedAnimation(
//   //   parent: _controller,
//   //   curve: Curves.elasticOut,
//   // );
//   // void _animatelisten() {
//   //   if (_isPlaying) {
//   //     _controller.stop();
//   //     _isPlaying = false;
//   //   } else {
//   //     _controller.forward();
//   //     _controller.addListener(() {
//   //       if (_controller.isCompleted) {
//   //         _controller.repeat();
//   //       }
//   //     });
//   //     _isPlaying = true;
//   //   }
//   // }

//   void _scrollListener() {
//     if (_isShrink != lastStatus) {
//       setState(() {
//         lastStatus = _isShrink;
//       });
//     }
//   }

//   void _loadSong(index) async {
//     currentPlay = index;
//     if (!_isPlaying) {
//       _controller.forward();
//       _controller.addListener(() {
//         if (_controller.isCompleted) {
//           _controller.repeat();
//         }
//       });
//       setState(() {
//         _isPlaying = true;
//       });
//       await audioPlayer.play(UrlSource('${data[currentPlay].data?.song?.file?.audio_url}'));
//       audioPlayer.onPlayerComplete.listen((event) {
//         if (_isRepeat) {
//           _loadSong(currentPlay);
//         }
//         if (!_isRepeat && _isShuffle) {
//           Random random = new Random();
//           int i = currentPlay + random.nextInt(data.length);

//           _loadSong(i % data.length);
//         }
//         if (!_isRepeat && !_isShuffle) {
//           if (currentPlay == data.length-1) {
//             _loadSong(0);
//           } else {
//             _loadSong(currentPlay + 1);
//           }
//         }
//       });
//     } else {
//       await audioPlayer.stop();
//       await audioPlayer.play(UrlSource('${data[currentPlay].data?.song?.file?.audio_url}'));
//       audioPlayer.onPlayerComplete.listen((event) {
//         if (_isRepeat) {
//           _loadSong(currentPlay);
//         }
//         if (!_isRepeat && _isShuffle) {
//           Random random = new Random();
//           int i = currentPlay + random.nextInt(data.length);

//           _loadSong(i % data.length);
//         }
//         if (!_isRepeat && !_isShuffle) {
//           if (currentPlay == data.length-1) {
//             _loadSong(0);
//           } else {
//             _loadSong(currentPlay + 1);
//           }
//         }
//       });
//     }
//   }

//   bool get _isShrink {
//     return _scrollcontroller != null &&
//         _scrollcontroller!.hasClients &&
//         _scrollcontroller!.offset > (height - kToolbarHeight);
//   }

//   void _fetch() async {
//     while (track.length < amount) {
//       Random rand = new Random();
//       var value = rand.nextInt(8500);
//       if (track.indexOf(value) == -1) {
//         track.add(value);
//       }
//     }
//     for(int i=0;i<20;i++){
//       var temp = await fetchPhotos(track[i]);
//       if(temp.data != null && temp.data?.song != null && temp.data?.song?.file != null && temp.data?.song?.file?.audio_url != null) {
//         setState(() {
//           data.add(temp);
//         });
//       }
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetch();
//     _scrollcontroller = ScrollController()..addListener(_scrollListener);
//     audioPlayer = AudioPlayer();
//     _controller.stop();
//     audioPlayer.onDurationChanged.listen((dur) {
//       setState(() {
//         _duration = dur;
//       });
//     });
//     audioPlayer.onPositionChanged.listen((pos) {
//       setState(() {
//         _position = pos;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _scrollcontroller?.removeListener(_scrollListener);
//     _scrollcontroller?.dispose();
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   Widget btnStart() {
//     return IconButton(
//       icon: _isPlaying
//           ? Icon(
//               Icons.pause_circle_filled,
//               color: Colors.red,
//             )
//           : Icon(
//               Icons.play_circle_filled,
//               color: Colors.red,
//             ),
//       onPressed: () async {
//         if (_isPlaying) {
//           await audioPlayer.pause();
//           _controller.stop();
//           setState(() {
//             _isPlaying = false;
//           });
//         } else {
//           _loadSong(currentPlay);
//           _controller.forward();
//           _controller.addListener(() {
//             if (_controller.isCompleted) {
//               _controller.repeat();
//             }
//           });
//           setState(() {
//             _isPlaying = true;
//           });
//         }
//       },
//     );
//   }

//   Widget btnBackward() {
//     return IconButton(
//       icon: _isPlaying
//           ? Icon(Icons.skip_previous)
//           : Icon(Icons.skip_previous_outlined),
//       onPressed: () {
//         if (currentPlay != 0) {
//           _loadSong(currentPlay - 1);
//         } else {
//           currentPlay = data.length-1;
//           _loadSong(currentPlay);
//         }
//       },
//     );
//   }

//   Widget btnForward() {
//     return IconButton(
//       icon: _isPlaying ? Icon(Icons.skip_next) : Icon(Icons.skip_next_outlined),
//       onPressed: () {
//         if (currentPlay != data.length-1) {
//           _loadSong(currentPlay + 1);
//         } else {
//           currentPlay = 0;
//           _loadSong(currentPlay);
//         }
//       },
//     );
//   }

//   Widget bigbtnStart() {
//     return IconButton(
//       iconSize: 50,
//       icon: _isPlaying
//           ? Icon(
//               Icons.pause_circle_filled,
//               color: Colors.red,
//             )
//           : Icon(
//               Icons.play_circle_filled,
//               color: Colors.red,
//             ),
//       onPressed: () async {
//         if (_isPlaying) {
//           await audioPlayer.pause();
//           _controller.stop();
//           setState(() {
//             _isPlaying = false;
//           });
//         } else {
//           _loadSong(currentPlay);
//           _controller.forward();
//           _controller.addListener(() {
//             if (_controller.isCompleted) {
//               _controller.repeat();
//             }
//           });
//           setState(() {
//             _isPlaying = true;
//           });
//         }
//       },
//     );
//   }

//   Widget bigbtnBackward() {
//     return IconButton(
//       iconSize: 50,
//       icon: _isPlaying
//           ? Icon(Icons.skip_previous)
//           : Icon(Icons.skip_previous_outlined),
//       onPressed: () {
//         if (currentPlay != 0) {
//           _loadSong(currentPlay - 1);
//         } else {
//           currentPlay = data.length-1;
//           _loadSong(currentPlay);
//         }
//       },
//     );
//   }

//   Widget bigbtnForward() {
//     return IconButton(
//       iconSize: 50,
//       icon: _isPlaying ? Icon(Icons.skip_next) : Icon(Icons.skip_next_outlined),
//       onPressed: () {
//         if (currentPlay != data.length-1) {
//           _loadSong(currentPlay + 1);
//         } else {
//           currentPlay = 0;
//           _loadSong(currentPlay);
//         }
//       },
//     );
//   }

//   Widget Repeater() {
//     return IconButton(
//       icon: _isRepeat
//           ? Icon(
//               Icons.repeat_rounded,
//               color: Colors.red,
//             )
//           : Icon(
//               Icons.repeat_rounded,
//               color: Colors.black,
//             ),
//       onPressed: () {
//         if (_isRepeat) {
//           setState(() {
//             _isRepeat = false;
//           });
//         } else {
//           setState(() {
//             _isRepeat = true;
//           });
//         }
//       },
//     );
//   }

//   Widget Sheffler() {
//     return IconButton(
//       icon: _isShuffle
//           ? Icon(Icons.shuffle, color: Colors.red)
//           : Icon(Icons.shuffle, color: Colors.black),
//       onPressed: () {
//         if (_isShuffle) {
//           setState(() {
//             _isShuffle = false;
//           });
//         } else {
//           setState(() {
//             _isShuffle = true;
//           });
//         }
//       },
//     );
//   }

//   Widget Bar() {
//     return Slider(
//         activeColor: Colors.red,
//         inactiveColor: Colors.black,
//         value: _position.inSeconds.toDouble(),
//         min: 0.0,
//         max: _duration.inSeconds.toDouble(),
//         onChanged: (double value) {
//           setState(() {
//             changeToSecond(value.toInt());
//             value = value;
//           });
//         });
//   }

//   void changeToSecond(int sec) {
//     Duration newDur = Duration(seconds: sec);
//     audioPlayer.seek(newDur);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Center(
//       //     child: Text('Music'),
//       //   ),
//       // ),
//       body: Center(
//         child: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               stops: [
//                 0.0,
//                 0.3,
//                 0.6,
//                 0.9,
//               ],
//               colors: [
//                 Colors.yellow,
//                 Colors.red,
//                 Colors.indigo,
//                 Colors.teal,
//               ],
//             )),
//             child: Center(
//               child: Stack(clipBehavior: Clip.none, children: [
//                 CustomScrollView(
//                   controller: _scrollcontroller,
//                   slivers: <Widget>[
//                     SliverAppBar(
//                       pinned: true,
//                       expandedHeight: 420.0,
//                       backgroundColor: Colors.white.withOpacity(0.5),
//                       stretch: true,
//                       actions: _isShrink
//                           ? [
//                               btnBackward(),
//                               btnStart(),
//                               btnForward(),
//                             ]
//                           : null,
//                       leading: IconButton(
//                         icon: Icon(Icons.loop),
//                         onPressed: () {
//                           setState(() {
//                             data = [];
//                             _isPlaying = false;
//                             _isRepeat = false;
//                             _isShuffle = false;
//                             _fetch();
//                           });
//                         },
//                       ),
//                       flexibleSpace: Container(
//                         child: FlexibleSpaceBar(
//                           collapseMode: CollapseMode.parallax,
//                           stretchModes: [
//                             StretchMode.zoomBackground,
//                             StretchMode.fadeTitle
//                           ],
//                           background: SafeArea(
//                             child: Center(
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 50.0, bottom: 20.0),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(100),
//                                       child: RotationTransition(
//                                         turns: _controller,
//                                         child: Image.network(
//                                           height: 200,
//                                           width: 200,
//                                           fit: BoxFit.cover,
//                                           data.length > 0 && data[currentPlay].data != null && data[currentPlay].data?.song != null && data[currentPlay].data?.song?.thumbnail != null && data[currentPlay].data?.song?.thumbnail?.url != null ? '${data[currentPlay].data?.song?.thumbnail?.url}' : "https://thumbs.dreamstime.com/z/error-page-not-found-vector-vinyl-music-broken-graphic-error-page-not-found-vector-vinyl-music-broken-graphic-background-156624909.jpg",
//                                           errorBuilder:
//                                               (context, error, stackTrace) {
//                                             //do something
//                                             return Image(
//                                               image: NetworkImage(
//                                                 "https://thumbs.dreamstime.com/z/error-page-not-found-vector-vinyl-music-broken-graphic-error-page-not-found-vector-vinyl-music-broken-graphic-background-156624909.jpg",
//                                               ),
//                                               height: 200,
//                                               width: 200,
//                                               fit: BoxFit.cover,
//                                             );
//                                           },
//                                         ),
//                                         // Image(
//                                         //   image: NetworkImage(
//                                         //       "https://thumbs.dreamstime.com/z/error-page-not-found-vector-vinyl-music-broken-graphic-error-page-not-found-vector-vinyl-music-broken-graphic-background-156624909.jpg"),
//                                         //   fit: BoxFit.cover,
//                                         //   height: 200,
//                                         //   width: 200,
//                                         // ),
//                                       ),
//                                     ),
//                                   ),
//                                   Center(
//                                     child: Text(
//                                       data.length > 0 && data[currentPlay].data != null && data[currentPlay].data?.song != null && data[currentPlay].data?.song?.title != null ? '${data[currentPlay].data?.song?.title}' : "loading",
//                                       style: textTheme.headline5,
//                                     ),
//                                   ),
//                                   Container(
//                                       width: 480,
//                                       height: 75,
//                                       child: Stack(
//                                         children: [
//                                           Sheffler(),
//                                           Positioned(
//                                             child: bigbtnBackward(),
//                                             left: 80,
//                                             bottom: -10,
//                                           ),
//                                           Positioned(
//                                             child: bigbtnStart(),
//                                             left: 165,
//                                             bottom: -10,
//                                           ),
//                                           Positioned(
//                                             child: bigbtnForward(),
//                                             left: 250,
//                                             bottom: -10,
//                                           ),
//                                           Positioned(
//                                             child: Repeater(),
//                                             left: 340,
//                                           ),
//                                           Positioned(
//                                             child: Bar(),
//                                             bottom: 35,
//                                             left: 100,
//                                           ),
//                                           Positioned(
//                                             child: Text(_position
//                                                 .toString()
//                                                 .split(".")[0]),
//                                             bottom: 20,
//                                             left: 10,
//                                           ),
//                                           Positioned(
//                                             child: Text(_duration
//                                                 .toString()
//                                                 .split(".")[0]),
//                                             bottom: 20,
//                                             left: 330,
//                                           ),
//                                         ],
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           centerTitle: false,
//                           title: _isShrink
//                               ? BackdropFilter(
//                                   filter: ImageFilter.blur(
//                                     sigmaX: 5.0,
//                                     sigmaY: 5.0,
//                                   ),
//                                   child: Text(data.length > 0 && data[currentPlay].data != null && data[currentPlay].data?.song != null && data[currentPlay].data?.song?.title != null ? '${data[currentPlay].data?.song?.title}' : "loading"))
//                               : null,
//                         ),
//                       ),
//                     ),
//                     SliverFixedExtentList(
//                       itemExtent: 75.0,
//                       delegate: SliverChildBuilderDelegate(
//                         (BuildContext context, int index) {
//                           return Padding(
//                               padding:
//                                   EdgeInsets.only(top: 5, left: 5, right: 5),
//                               child: TextButton(
//                                 style: index == currentPlay
//                                     ? ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 Colors.red))
//                                     : ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 Colors.white)),
//                                 onPressed: () => _loadSong(index),
//                                 child: Container(
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Colors.white,
//                                     ),
//                                     // child: Text('$fetchAlbum(index)'),
//                                     child: Text( data.length > 0 && data[index].data != null && data[index].data?.song != null && data[index].data?.song?.title != null ? '${data[index].data?.song?.title}' : "loading")),

//                               ));
//                         },
//                         childCount: data.length > 0 ? data.length : 0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ]),
//             )),
//       ),
//     );
//   }
// }