import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/core/app_colors.dart';
import 'package:quiz_flutter_app/core/app_gradients.dart';
import 'package:quiz_flutter_app/core/app_images.dart';
import 'package:quiz_flutter_app/core/app_text_styles.dart';
import 'package:quiz_flutter_app/models/quiz_model.dart';
import 'package:quiz_flutter_app/models/user_model.dart';
import 'package:quiz_flutter_app/widgets/score_card/score_card_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 185,
                    width: double.infinity,
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(
                            text: 'Olá, ',
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                  text: user.name,
                                  style: AppTextStyles.titleBold)
                            ])),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            user.photoUrl,
                            height: 58,
                            width: 58,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment(0.0, 1.6),
                      child: ScoreCardWidget(
                        percent: user.score / 100,
                      ))
                ],
              ),
            ));
}
