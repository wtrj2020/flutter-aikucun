import 'package:flutter/material.dart';
import 'package:xshop/Class/ConfirmOrderClass.dart';
import 'package:xshop/Common/server_method.dart';

class CartPagePayProvider with ChangeNotifier {
  ConfirmOrderClass data;
  int groupValueb;
String payFrom;
  CartPagePayProvider.instance() {
    //
  }

  CartPagePayProvider.eee(int valueb,String payFrom) {
    this.groupValueb=valueb;
    this.payFrom=payFrom;
    notifyListeners();
  }
  Future request() async {
    var formData={
    "order_src": "ios",
    "order_remarks": "挑好的给",
    "address_id": 1,
    "pay_from":"wallets"
    };
    await requestPost('Submit',formData:formData ).then((val) {
      data = ConfirmOrderClass.fromJson(val);
    });

    // for (var item in data.data) {
    //   if (item.isDefault == 1) {
    //     groupValueb = item.addressId;
    //     break;
    //   }
    // }
    return '填充完成';
  }

  void changeValue(value) async {
    groupValueb = value;
    await editRequest(value, 0);

    notifyListeners();
  }

  Future editRequest(addressId, int dataFlag) async {
    await requestPost('EditIsdefaultAddress', formData: {"address_id": addressId, "data_flag": dataFlag}).then((val) {
      //data = MyAddressListClass.fromJson(val);
    });
    return '填充完成';
  }

  void delAddress(int value) async {
    await editRequest(value, 1);
    notifyListeners();
  }
}



class CartPagePayChangeProvider with ChangeNotifier {
  ConfirmOrderClass data;
  int groupValueb;

  CartPagePayChangeProvider.instance() {
    //
  }


  void changeValue(value,payFrom) async {
    CartPagePayProvider.eee(groupValueb,payFrom);
    groupValueb = value;
   // await editRequest(value, 0);

    notifyListeners();
  }


}
