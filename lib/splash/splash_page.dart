import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/core/app_gradients.dart';
import 'package:quiz_flutter_app/core/app_images.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2))
        .then((_) => Navigator.of(context).pushReplacementNamed('/home'));

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          child: Center(
            child: Image.asset(AppImages.logo),
          )),
    );
  }
}
