import 'package:flutter/foundation.dart';

class ChallengeController extends ChangeNotifier {
  int currentPage = 1;
  int questionsAwnsered = 0;
  int totalRights = 0;
  int indexSelected = -1;

  static ChallengeController controller = ChallengeController();

  void setCurrentPage(int value) {
    currentPage = value;
    notifyListeners();
  }

  void setIndexSelected(int indexSelectedAwnser) {
    indexSelected = indexSelectedAwnser;
    notifyListeners();
  }

  int get getCurrentPage => currentPage;

  int get getIndexSeletected => indexSelected;
}
