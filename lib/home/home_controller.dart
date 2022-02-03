import 'package:flutter/foundation.dart';
import 'package:quiz_flutter_app/core/app_images.dart';
import 'package:quiz_flutter_app/home/home_repository.dart';
import 'package:quiz_flutter_app/home/home_state.dart';
import 'package:quiz_flutter_app/models/awnser_model.dart';
import 'package:quiz_flutter_app/models/question_model.dart';
import 'package:quiz_flutter_app/models/quiz_model.dart';
import 'package:quiz_flutter_app/models/user_model.dart';

class HomeController extends ChangeNotifier {
  HomeState state = HomeState.empty;
  UserModel? user;
  List<QuizModel>? quizzes;

  static HomeController homeController = HomeController();

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
    notifyListeners();
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
    notifyListeners();
  }
}
