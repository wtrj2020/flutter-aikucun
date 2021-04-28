import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xshop/CartPageAddAddres/CartPageAddAddress.dart';
import 'package:xshop/Class/MyAddressListClass.dart';

import 'CartPageAddressProvider.dart';

class CartPageAddressView extends StatelessWidget {
  const CartPageAddressView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartPageAddressProvider>(
        create: (context) => CartPageAddressProvider.instance(),
        child: Consumer<CartPageAddressProvider>(
          builder: (context, viewModel, child) {
            return FutureBuilder(
                future: viewModel.request(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        title: Text('收货地址'), //
                      ),
                      body: ListView(
                        children: <Widget>[...viewModel.data.data.map((f) => addressItem(f, viewModel))],
                      ),
                      bottomNavigationBar: SafeArea(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //  SizedBox(width: 50),
                          Container(
                            width: 300,
                            child: FlatButton(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))), //设置圆角
                              child: Text('新增地址'),
                              color: Colors.red,
                              textColor: Colors.white,
                              onPressed: () async {
                                Get.to(CartPageAddAddress(), opaque: true, transition: Transition.fade);

                                // await Navigator.of(context).push(MaterialPageRoute(builder: (context) => new AddressEditPage()));
                              },
                            ),
                          ),
                          //   SizedBox(width: 50),
                        ],
                      )),
                    );
                  } else {
                    return Scaffold();
                  }
                });
          },
        ));
  }

  Widget addressItem(Data f, CartPageAddressProvider v) {
    return Row(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 350),
          child: RadioListTile(
            value: f.addressId,
            groupValue: v.groupValueb,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[Text(f.userName), SizedBox(width: 5), Text(f.userPhone)],
                ),
                //Image.asset('assets/icons/edit.png', width: 22, height: 22, color: Colors.black),
              ],
            ),
            subtitle: Text(f.userAddress),
            onChanged: (value) {
              //Provide.value<GetCartListP>(context).userAddresssetDefault(value); //更新上一个页数据
              // Provide.value<GetUserAddressP>(context).changeValue(value); //选中的按钮
              v.changeValue(value);
              // Get.back();
            },
          ),
        ),
        IconButton(
          color: Colors.black38,
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            v.delAddress(f.addressId);
          },
        )
      ],
    );
  }
}
