import 'dart:convert';

import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:xshop/Common/server_method.dart';

class CartPageAddAddress extends StatefulWidget {
  @override
  _CartPageAddAddressState createState() => _CartPageAddAddressState();
}

var groupValueb;
var addrssview;
var areaId;

Result resultArr = new Result();

String myName = '';
String myPhone = '';
String myAddrss = '';
String myAddrssFull;
String shangjiId;
String shangjiName;

class _CartPageAddAddressState extends State<CartPageAddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff4f5f6),
      appBar: AppBar(
        title: Text('新增收货地址'),
        elevation: 0, //
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 8),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('收货人'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 60,
                        child: TextField(
                          cursorWidth: 2,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          maxLength: 15,
                          maxLengthEnforced: true,
                          decoration: InputDecoration(border: InputBorder.none, counterText: '', contentPadding: EdgeInsets.only(top: 12)),
                          onChanged: _textFieldChangedName,
                          autofocus: false,
                          autocorrect: false,
                          textDirection: TextDirection.ltr,
                        ),
                      )
                    ],
                  ),
                  Divider(height: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('手机号'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 60,
                        child: TextField(
                          cursorWidth: 2,
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                          maxLength: 11,
                          maxLengthEnforced: true,
                          decoration: InputDecoration(border: InputBorder.none, counterText: '', contentPadding: EdgeInsets.only(top: 12)),
                          onChanged: _textFieldChangedPhone,
                          autofocus: false,
                          autocorrect: false,
                          textDirection: TextDirection.ltr,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    // width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        _clickEventFunc();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('选择地址'),
                          Text(
                            addrssview ?? '请选择>',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                          //Text(resultArr.provinceName+resultArr.cityName+resultArr.areaName),
                        ],
                      ),
                    ),
                  ),
                  Divider(height: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('详细地址'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 60,
                        child: TextField(
                          cursorWidth: 2,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          maxLength: 30,
                          maxLengthEnforced: true,
                          decoration: InputDecoration(border: InputBorder.none, counterText: '', contentPadding: EdgeInsets.only(top: 12)),
                          onChanged: _textFieldChangedAddrss,
                          autofocus: false,
                          autocorrect: false,
                          textDirection: TextDirection.ltr,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 0)
        ],
      ),
      bottomNavigationBar: SafeArea(
          child: FlatButton(
        child: Text('保存'),
        color: Colors.red,
        textColor: Colors.white,
        onPressed: () async {
          // isPhone(myPhone);
          if (myName.length < 2) {
            errDialog('收货人没写');
            return;
          }
          if (!isPhone(myPhone)) {
            errDialog('手机号格式不正确');
            return;
          }
          if (resultArr.provinceName == null) {
            errDialog('请选择地址');
            return;
          }
          if (myAddrss.length < 3) {
            errDialog('详细地址具体到门牌号');
            return;
          }
          if (resultArr.provinceId != null) {
            areaId = resultArr.provinceId;
          }
          if (resultArr.cityId != null) {
            shangjiId = areaId = resultArr.cityId;
            shangjiName = resultArr.cityName;
          }
          if (resultArr.areaId != null) {
            areaId = resultArr.areaId;
            shangjiName = resultArr.areaName; //如果api没有这个地址则和详细地址放在一起
          }

          //var aaa = resultArr.toString();
          // print(base64Encode(utf8.encode(resultArr.toString())));

          // base64Encode(utf8.encode(base64Encode(utf8.encode(_phone));

          //      base64Encode(utf8.encode(resultArr.toString()))
          //Provide.value<GetUserAddressP>(context).userAddressedits(myName, myPhone, areaId, myAddrss,base64Encode(utf8.encode(resultArr.toString())));
          // myName = '';
          // myPhone = '';
          // myAddrss = ''; //resultArr
          // myAddrssFull = '';
          // Provide.value<GetUserAddressP>(context).getUserAddress();
          //Provide.value<GetUserAddressP>(context).change();
          //  Navigator.pop(context);
          // print(myName);
          // print(myPhone);
          // print(areaId);
          // print(resultArr.provinceName + resultArr.cityName + resultArr.areaName + myAddrss); //int.parse("100");

          await requestPost('AddMyAddress',
                  formData: {"user_name": myName, "user_phone": myPhone, "area_id": int.parse(areaId), "user_address": resultArr.provinceName + resultArr.cityName + resultArr.areaName + myAddrss})
              .then((val) {
            myName = '';
            myPhone = '';
            myAddrss = ''; //resultArr
            myAddrssFull = '';
            //resultArr=null;
            Navigator.pop(context);
          });
          // }
        },
      )),
    );
  }

  void _clickEventFunc() async {
    Result tempResult = await CityPickers.showCityPicker(
        context: context,
        //locationCode:"222200",
        theme: new ThemeData(
          
            primaryColor: Color(0xFFC91B3A),
            backgroundColor: Color(0xFFEFEFEF),
            accentColor: Color(0xFF888888),
            textTheme: TextTheme(
              //设置Material的默认字体样式
              body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
            )));

    if (tempResult != null) {
      setState(() {
        resultArr = tempResult;

        addrssview = "${resultArr?.provinceName}-${resultArr?.cityName ?? ''}-${resultArr?.areaName ?? ''}";
        print(resultArr);
      });
    }
  }

  void _textFieldChangedName(String str) {
    myName = str;
    print(str);
  }

  void _textFieldChangedPhone(String str) {
    myPhone = str;
    print(str);
  }

  void _textFieldChangedAddrss(String str) {
    myAddrss = str;
    print(str);
  }

  void errDialog(String str) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(child: Text(str)),
            ));
  }

  static bool isPhone(String input) {
    RegExp mobile = new RegExp(r"1[0-9]\d{9}$");
    return mobile.hasMatch(input);
  }

  Future _getdata() async {
    //await Provide.value<GetUserAddressP>(context).getUserAddress();
    return '数据填充完成';
  }
}
