import 'package:flutter/foundation.dart';

class ChallengeController extends ChangeNotifier {
  int currentPage = 1;
  int questionsAwnsered = 0;

  void setCurrentPage(int value) {
    currentPage = value;
    notifyListeners();
  }

  int get getCurrentPage => currentPage;
}
