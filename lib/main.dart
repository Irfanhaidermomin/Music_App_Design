import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant/constant.dart';
import 'page/music_play.dart';
import 'home/my_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyMusicApp());
}

class MyMusicApp extends StatelessWidget {
  const MyMusicApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'My Music App'),
        '/MusicPlay': (context) => const MusicPlay(),
      },
      theme: ThemeData(
          scaffoldBackgroundColor: kDefault,
          appBarTheme: const AppBarTheme(backgroundColor: kDefaultColor)),
    );
  }
}
