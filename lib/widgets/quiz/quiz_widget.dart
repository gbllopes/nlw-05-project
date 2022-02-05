import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/challenge/challenge_controller.dart';

import 'package:quiz_flutter_app/core/core.dart';
import 'package:quiz_flutter_app/models/question_model.dart';
import 'package:quiz_flutter_app/widgets/awnser/awnser_widget.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final bool isConfirmed;
  QuizWidget({
    Key? key,
    required this.question,
    required this.isConfirmed,
  }) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  void initState() {
    ChallengeController.controller.addListener(() {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
          ),
          ...widget.question.awnsers
              .map(
                (e) => AwnserWidget(
                  awnser: e.title,
                  isRight: e.isRight,
                  indexAwnser: widget.question.awnsers.indexOf(e),
                  indexSelectedAwnser:
                      ChallengeController.controller.getIndexSeletected,
                  isSelected:
                      ChallengeController.controller.getIndexSeletected ==
                          widget.question.awnsers.indexOf(e),
                  isConfirmed: widget.isConfirmed,
                  onTap: () {
                    if (!widget.isConfirmed) {
                      ChallengeController.controller
                          .setIndexSelected(widget.question.awnsers.indexOf(e));
                    }
                  },
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
