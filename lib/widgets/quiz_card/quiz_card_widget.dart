import 'package:flutter/material.dart';

import 'package:quiz_flutter_app/core/app_colors.dart';
import 'package:quiz_flutter_app/core/app_images.dart';
import 'package:quiz_flutter_app/core/core.dart';
import 'package:quiz_flutter_app/models/question_model.dart';
import 'package:quiz_flutter_app/models/quiz_model.dart';
import 'package:quiz_flutter_app/widgets/question_indicator/question_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int totalQuestionsAwnsered;
  final int totalQuestions;
  final String iconQuiz;
  final List<QuestionModel> questions;

  QuizCardWidget({
    Key? key,
    required this.title,
    required this.totalQuestionsAwnsered,
    required this.totalQuestions,
    required this.iconQuiz,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/challege', arguments: {
          'questions': questions,
          'totalQuestionsAwnsered': totalQuestionsAwnsered,
          'quizTitle': title
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 45,
              child: Image.asset('assets/images/${iconQuiz}.png'),
            ),
            SizedBox(
              height: 15,
            ),
            Text(title, style: AppTextStyles.heading15),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('${totalQuestionsAwnsered}/${totalQuestions}',
                        style: AppTextStyles.body11)),
                Expanded(
                  flex: 2,
                  child: QuestionIndicatorWidget(
                      percentagemConcluida:
                          totalQuestionsAwnsered / totalQuestions),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
