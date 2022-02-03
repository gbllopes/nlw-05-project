import 'package:quiz_flutter_app/challenge/challenge_page.dart';
import 'package:quiz_flutter_app/home/home_page.dart';
import 'package:quiz_flutter_app/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/widgets/app_bar/app_bar_widget.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
    );
  }
}
