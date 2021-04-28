import 'package:flutter/material.dart';

class IndexPageProvider extends ChangeNotifier {
  var currentIndex = 0;
  IndexPageProvider.instance() {}
  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
