import 'package:flutter/material.dart';

import 'package:quiz_flutter_app/core/core.dart';
import 'package:quiz_flutter_app/models/question_model.dart';
import 'package:quiz_flutter_app/widgets/awnser/awnser_widget.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  late bool isConfirmed;
  QuizWidget({
    Key? key,
    required this.question,
    required this.isConfirmed,
  }) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? indexSelected = -1;

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
                  indexSelectedAwnser: indexSelected,
                  isSelected:
                      indexSelected == widget.question.awnsers.indexOf(e),
                  isConfirmed: widget.isConfirmed,
                  onTap: () {
                    setState(() {
                      indexSelected = widget.question.awnsers.indexOf(e);
                    });
                  },
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
