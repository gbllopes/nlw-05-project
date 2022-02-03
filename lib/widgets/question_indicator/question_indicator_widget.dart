import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/core/app_colors.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final double percentagemConcluida;
  QuestionIndicatorWidget({Key? key, required this.percentagemConcluida})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LinearProgressIndicator(
        value: percentagemConcluida,
        backgroundColor: AppColors.chartSecondary,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
      ),
    );
  }
}
