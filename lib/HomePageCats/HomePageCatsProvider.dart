import 'package:flutter/material.dart';
import 'package:xshop/Class/GoodsCatsClass.dart';
import 'package:xshop/Common/server_method.dart';

class HomePageCatsProvider extends ChangeNotifier {
  var currentIndex = 0;

  Color leftColor = Colors.red;
  Color rightColor = Colors.white;
  Color leftTextColor = Colors.white;
  Color rightTextColor = Colors.red;
  int tabBarIValue = 0;
  GoodsCatsClass data;

  HomePageCatsProvider.instance() {
    //TODO Add code here
    //getGoodsCats();
  }

  Future request() async {
    await requestGet('GoodsCats').then((val) {
      data = GoodsCatsClass.fromJson(val);
      print(val);
    });
    return '填充完成';
  }

  void changeTabBarIndex(int tabBarIndex) {
    if (tabBarIndex == 0) {
      leftColor = Colors.red;
      rightColor = Colors.white;
      leftTextColor = Colors.white;
      rightTextColor = Colors.red;
      tabBarIValue = tabBarIndex;
    } else if (tabBarIndex == 1) {
      rightColor = Colors.red;
      leftColor = Colors.white;
      leftTextColor = Colors.red;
      rightTextColor = Colors.white;
      tabBarIValue = tabBarIndex;
    }
    notifyListeners();
  }
}
