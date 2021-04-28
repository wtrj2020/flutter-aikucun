import 'package:flutter/material.dart';
import 'package:xshop/Class/MemberClass.dart';
import 'package:xshop/Common/server_method.dart';

class MemberPageProvider extends ChangeNotifier {
  var currentIndex = 0;
  MemberClass data;
  MemberPageProvider.instance() {}
  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

    Future request() async {
    await requestGet('Member').then((val) {
      data = MemberClass.fromJson(val);
      print(val);
    });
    return '填充完成';
  }
  
}
