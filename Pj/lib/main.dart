// import 'package:flutter/material.dart';
// import 'package:pj/music/MyApp.dart';
// import 'package:pj/music/Album.dart';

// // https://flutter.dev/docs/get-started/flutter-for/android-devs

// // Your APIKey : c09df9435bbce0d7c68a3efade096ff3613cdc1b3a6b7999c9434b8d889063f8
// // Link : https://allsportsapi.com/soccer-football-api-documentation#Countries
// // BASE_URL = https://allsportsapi.com/
// // https://allsportsapi.com/api/football/?met=Countries&APIkey=!_your_account_APIkey_!
// // UI : https://dribbble.com/search/soccer
// // Codelabs : https://flutter.dev/docs/codelabs
// // Dribbble : https://dribbble.com/shots/7053978-Check-Scores-App

// String path =
//     "https://api2.bcdcnt.net/graphql?query=query(\$id:+ID!)+%7B%0A+song(id:+\$id)+%7B%0Aid%0Atitle%0Asubtitle%0Aslug%0Acontent%0Aviews%0Adownloads%0Afile_type%0Alyric_type%0Astatus%0Ayear%0Arecord_year%0Aallow_comment%0Acreated_at%0Aartists(first:+10,+orderBy:+[%7Bcolumn:+%22song_artist.order%22,+order:+ASC%7D])+%7B%0Adata+%7B%0Aid%0Atitle%0Aslug%0Aavatar+%7B%0Aurl%0A%7D%0A%7D%0A%7D%0Acomposers(first:+10,+orderBy:+[%7Bcolumn:+%22song_composer.order%22,+order:+ASC%7D])+%7B+%0A+data+%7B+%0A+id%0A+title%0A+slug%0A+%7D%0A+%7D%0A+poets(first:+10)+%7B%0A+data+%7B%0Aid%0A++title%0A+slug%0A++%7D%0A+%7D%0A+thumbnail+%7B%0A+url%0A+user+%7B%0A+id%0A+username%0Aavatar+%7B%0Aurl%0A%7D%0A%7D%0A%7D%0Afile+%7B%0Avideo_url%0Aaudio_url%0A+%7D%0A+uploader+%7B%0A+id%0A+username%0A+avatar+%7B%0Aurl%0A%7D%0A%7D%0Adocuments(first:+10)+%7B%0Adata+%7B%0Aid%0Atitle%0Aslug%0Athumbnail+%7B%0A+url%0A%7D%0A%7D%0A%7D%0A%7D%0A%7D&variables=%7B%22id%22:%227614%22%7D";
// // bool isLoggedIn = false;
// void main() async {
//   // await Hive.initFlutter();
//   // await Hive.openBox('Setting');
//   // await Hive.openBox('Account');
//   // await Hive.openBox('RandomWords');
//   // var box = Hive.box('Setting');
//   // box.put('fistful','dollar');
//   // print(box.get('fistful'));
//   runApp(MyApp());
// }

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pj/injection.dart';
import 'package:pj/presentation/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  DependencyCreator.init();
  await DependencyCreator.initServices();
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(AppWidget()));

  HttpOverrides.global = MyHttpOverrides();
  runApp(AppWidget());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
