import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xshop/Class/ActionsGoodsListClass.dart';
import 'package:xshop/Common/server_method.dart';

ActionsGoodsListClass datas;

class HomePageActionsDetailslProvider with ChangeNotifier {
  var currentIndex = 0;

  Color leftColor = Colors.red;
  Color rightColor = Colors.white;
  Color leftTextColor = Colors.white;
  Color rightTextColor = Colors.red;
  int tabBarIValue = 0;
  ActionsGoodsListClass data;

  HomePageActionsDetailslProvider.instance() {
    //TODO Add code here
  }
  //ActionsGoodsListClass get value =>data;//将——value暴露出去

  Future request(int themeId, actStatus, catId, isPage, pageNum, pageSize) async {
    var formData = {"themeId": themeId, "ActStatus": actStatus, "CatId": catId, "ShopId": 0, "IsPage": 0, "PageNum": 1, "PageSize": 10};
    await requestPost('ActionsGoodsList', formData: formData).then((val) {
      data = ActionsGoodsListClass.fromJson(val);
      datas = data;
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

  // void addcart(int index, int id) {
  //   data.data[index].goodsSpecs[id].cartNum = data.data[index].goodsSpecs[id].cartNum + 1;
  //   print(data.data[index].goodsSpecs[id].cartNum);
  //   notifyListeners();

  //   //data.data[index].goodsSpecs[id].cartNum++;
  //   // print(data.data[index].goodsSpecs[id].cartNum);
  //   //notifyListeners();
  // }
}

class HomePageActionsDetailsCartlProvider with ChangeNotifier {
  var currentIndex = 0;

  Color leftColor = Colors.red;
  Color rightColor = Colors.white;
  Color leftTextColor = Colors.white;
  Color rightTextColor = Colors.red;
  int tabBarIValue = 0;
  ActionsGoodsListClass data;
  List<GoodsSpecs> cartArr = []; //点击确定 存储购买大大于0的数据集

  int iscart = 0;
  HomePageActionsDetailsCartlProvider.instance() {
    data = datas;

    //notifyListeners();
    //TODO Add code here
  }



  int bohuoValue=2;
  //ActionsGoodsListClass get value =>data;//将——value暴露出去

  // Future request(int themeId, actStatus, catId, isPage, pageNum, pageSize) async {
  //   var formData = {"themeId": themeId, "ActStatus": actStatus, "CatId": catId, "ShopId": 0, "IsPage": 0, "PageNum": 1, "PageSize": 10};
  //   await requestPost('ActionsGoodsList', formData: formData).then((val) {
  //     data = ActionsGoodsListClass.fromJson(val);
  //     datas = data;
  //     print(val);
  //   });
  //   return '填充完成';
  // }

  // void changeTabBarIndex(int tabBarIndex) {
  //   if (tabBarIndex == 0) {
  //     leftColor = Colors.red;
  //     rightColor = Colors.white;
  //     leftTextColor = Colors.white;
  //     rightTextColor = Colors.red;
  //     tabBarIValue = tabBarIndex;
  //   } else if (tabBarIndex == 1) {
  //     rightColor = Colors.red;
  //     leftColor = Colors.white;
  //     leftTextColor = Colors.red;
  //     rightTextColor = Colors.white;
  //     tabBarIValue = tabBarIndex;
  //   }
  //   notifyListeners();
  // }

void changeBohuoValue(value){
  bohuoValue=value;
  notifyListeners();
}
  void addcart(int index, int id) {
    if (data.data[index].goodsSpecs[id].goodsStock > data.data[index].goodsSpecs[id].cartNum) {
      data.data[index].goodsSpecs[id].cartNum = data.data[index].goodsSpecs[id].cartNum + 1;
    }
    print(data.data[index].goodsSpecs[id].cartNum);
    iscart = data.data[index].goodsSpecs[id].cartNum;
    notifyListeners();
  }

  void subcart(int index, int id) {
    if (data.data[index].goodsSpecs[id].cartNum != 0) {
      data.data[index].goodsSpecs[id].cartNum = data.data[index].goodsSpecs[id].cartNum - 1;
    }
    iscart = data.data[index].goodsSpecs[id].cartNum;

    notifyListeners();
  }

  Future confirmCart(int index) async {
    //找到
    for (var i = 0; i < data.data[index].goodsSpecs.length; i++) {
      if (data.data[index].goodsSpecs[i].cartNum > 0) {
        data.data[index].goodsSpecs[i].goodsSpecId = data.data[index].goodsSpecs[i].id;
        data.data[index].goodsSpecs[i].isCheck = 1;
        cartArr.add(data.data[index].goodsSpecs[i]);
      }
    }
    //请求
    await requestPost('AddCart', formData: cartArr).then((val) {
      print((val));
    });
    //清理
    for (var i = 0; i < data.data[index].goodsSpecs.length; i++) {
      if (data.data[index].goodsSpecs[i].cartNum > 0) {
        data.data[index].goodsSpecs[i].goodsSpecId = 0;
        data.data[index].goodsSpecs[i].isCheck = 0;
        data.data[index].goodsSpecs[i].cartNum = 0;
      }
    }
  }
}
