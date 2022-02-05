import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_flutter_app/challenge/challenge_controller.dart';
import 'package:quiz_flutter_app/core/core.dart';
import 'package:quiz_flutter_app/models/question_model.dart';
import 'package:quiz_flutter_app/widgets/next_button/next_button_widget.dart';
import 'package:quiz_flutter_app/widgets/question_indicator/question_indicator_widget.dart';
import 'package:quiz_flutter_app/widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final pageController = PageController();

  bool isConfirmed = false;
  String actionButton = 'Confirmar';

  @override
  void initState() {
    ChallengeController.controller.addListener(() {});
    pageController.addListener(() {
      ChallengeController.controller
          .setCurrentPage(pageController.page!.toInt() + 1);
    });
    super.initState();
  }

  void changeActionButton(
      List<QuestionModel> questions, String quizTitle, int indexSelected) {
    if (!mounted) {
      return;
    }
    setState(() {
      if (indexSelected > -1) {
        isConfirmed = actionButton == 'Confirmar' ? true : false;
        actionButton = actionButton == 'Confirmar' ? 'Avançar' : 'Confirmar';
      }
    });

    if (!isConfirmed) {
      if (indexSelected > -1) {
        if (pageController.page!.toInt() + 1 < questions.length) {
          pageController.nextPage(
              duration: Duration(milliseconds: 100), curve: Curves.linear);
        } else {
          Navigator.of(context).pushReplacementNamed('/result', arguments: {
            'quizTitle': quizTitle,
            'totalQuizQuestions': questions.length,
            'totalSuccesses': ChallengeController.controller.totalRights
          });
        }
        ChallengeController.controller.setIndexSelected(-1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ChallengeController.controller.addListener(() {});

    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    List<QuestionModel> questions = arguments['questions'];
    String quizTitle = arguments['quizTitle'];
    int totalQuestionsAwnsered = arguments['totalQuestionsAwnsered'];

    ChallengeController.controller.setCurrentPage(totalQuestionsAwnsered > 0
        ? totalQuestionsAwnsered
        : totalQuestionsAwnsered + 1);

    print(ChallengeController.controller.getCurrentPage);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          top: true,
          child: Container(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ChallengeController.controller.setIndexSelected(-1);
                          Navigator.of(context).pushReplacementNamed('/home');
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Questão ${ChallengeController.controller.getCurrentPage}',
                      style: GoogleFonts.notoSans(color: AppColors.grey),
                    ),
                    Text(
                      'de ${questions.length}',
                      style: GoogleFonts.notoSans(color: AppColors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                QuestionIndicatorWidget(
                    percentagemConcluida:
                        ChallengeController.controller.getCurrentPage /
                            questions.length),
              ],
            ),
          )),
        ),
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: questions
            .map((question) => QuizWidget(
                  question: question,
                  isConfirmed: isConfirmed,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (!isConfirmed &&
                  ChallengeController.controller.currentPage <
                      questions.length) ...[
                Expanded(
                    child: NextButtonWidget(
                  label: 'Pular',
                  acao: () => pageController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.linear),
                )),
                SizedBox(width: 7),
              ],
              Expanded(
                  child: NextButtonWidget(
                label: actionButton,
                acao: () => {
                  changeActionButton(questions, quizTitle,
                      ChallengeController.controller.getIndexSeletected)
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
