import 'package:flutter/material.dart';
import 'package:xshop/Class/CartPageClass.dart';
import 'package:xshop/Common/server_method.dart';

class CartPageProvider with ChangeNotifier {
  CartPageClass data;
  CartPageProvider.instance() {
    //
  }
  Future request() async {
    await requestGet('MyCartList').then((val) {
      data = CartPageClass.fromJson(val);
    });
    return '填充完成';
  }

  Future delCart(int cartId) async {
    await requestPost('DelOnlyCart', formData: {'cart_id': cartId}).then((val) {
      //data = CartPageClass.fromJson(val);
    });
    notifyListeners();
    return '填充完成';
  }
}
