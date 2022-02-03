import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/challenge/challenge_controller.dart';
import 'package:quiz_flutter_app/challenge/challenge_page.dart';
import 'package:quiz_flutter_app/home/home_page.dart';
import 'package:quiz_flutter_app/splash/splash_page.dart';
import 'core/app_widget.dart';
import 'home/home_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider<ChallengeController>(
            create: (_) => ChallengeController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppWidget(),
      initialRoute: '/splash',
      routes: {
        '/home': (context) => HomePage(),
        '/splash': (context) => SplashPage(),
        '/challege': (context) => ChallengePage(),
      },
    );
  }
}
