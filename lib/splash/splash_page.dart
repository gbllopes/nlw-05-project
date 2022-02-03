import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/core/app_gradients.dart';
import 'package:quiz_flutter_app/core/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: Center(
              child: Image.asset(AppImages.logo),
            )),
      ),
    );
  }
}
