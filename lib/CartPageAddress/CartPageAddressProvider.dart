import 'package:flutter/material.dart';
import 'package:xshop/Class/MyAddressListClass.dart';
import 'package:xshop/Common/server_method.dart';

class CartPageAddressProvider with ChangeNotifier {
  MyAddressListClass data;
  int groupValueb;

  CartPageAddressProvider.instance() {
    //
  }
  Future request() async {
    await requestGet('MyAddressList').then((val) {
      data = MyAddressListClass.fromJson(val);
    });

    for (var item in data.data) {
      if (item.isDefault == 1) {
        groupValueb = item.addressId;
        break;
      }
    }
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
