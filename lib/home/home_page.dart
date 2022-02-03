import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/core/app_colors.dart';
import 'package:quiz_flutter_app/home/home_controller.dart';
import 'package:quiz_flutter_app/home/home_state.dart';
import 'package:quiz_flutter_app/widgets/app_bar/app_bar_widget.dart';
import 'package:quiz_flutter_app/widgets/level_button/level_button_widget.dart';
import 'package:quiz_flutter_app/widgets/quiz/quiz_widget.dart';
import 'package:quiz_flutter_app/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: 'Fácil',
                  ),
                  LevelButtonWidget(
                    label: 'Médio',
                  ),
                  LevelButtonWidget(
                    label: 'Difícil',
                  ),
                  LevelButtonWidget(
                    label: 'Perito',
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView(children: [
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    physics:
                        NeverScrollableScrollPhysics(), // Desabilitar Scroll da GridView
                    shrinkWrap: true,

                    children: controller.quizzes!
                        .map((quiz) => QuizCardWidget(
                            title: quiz.title,
                            totalQuestions: quiz.questions.length,
                            totalQuestionsAwnsered: quiz.questionsAwnsered,
                            iconQuiz: quiz.imagem,
                            questions: quiz.questions))
                        .toList(),
                  ),
                ]),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
