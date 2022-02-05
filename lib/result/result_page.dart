import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_flutter_app/challenge/challenge_controller.dart';

import 'package:quiz_flutter_app/core/app_colors.dart';
import 'package:quiz_flutter_app/core/app_images.dart';
import 'package:quiz_flutter_app/core/core.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final String quizName = arguments['quizTitle'];
    final int totalQuizQuestions = arguments['totalQuizQuestions'];
    final int totalSuccesses = arguments['totalSuccesses'];

    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(height: 200),
          Image.asset(AppImages.trophy),
          SizedBox(height: 20),
          Text(
            'Parabéns!',
            style: GoogleFonts.notoSans(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
          ),
          SizedBox(height: 10),
          Text(
            'Você concluiu',
            style: GoogleFonts.notoSans(fontSize: 15, color: AppColors.grey),
          ),
          SizedBox(height: 5),
          Text(
            quizName,
            style: GoogleFonts.notoSans(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.grey),
          ),
          SizedBox(height: 5),
          Text(
            'com ${totalSuccesses} de ${totalQuizQuestions} acertos.',
            style: GoogleFonts.notoSans(fontSize: 15, color: AppColors.grey),
          ),
          SizedBox(height: 50),
          Container(
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.fromBorderSide(BorderSide(color: AppColors.border))),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                  ChallengeController.controller.setIndexSelected(-1);
                },
                child: Text(
                  'Voltar ao início',
                  style: GoogleFonts.notoSans(
                      fontSize: 15,
                      color: AppColors.grey,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    ));
  }
}
