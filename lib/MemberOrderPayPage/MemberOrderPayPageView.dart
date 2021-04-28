import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xshop/Class/ConfirmOrderClass.dart';
import 'package:xshop/Common/server_config.dart';
import 'package:xshop/Common/server_method.dart';
import 'package:xshop/IndexPage/IndexPageView.dart';
import 'package:xshop/Class/GetUserOrdersClass.dart' as orderinfo;

import 'MemberOrderPayProvider.dart';

class MemberOrderPayPageView extends StatelessWidget {
  final orderinfo.Data info;
  const MemberOrderPayPageView({Key key,this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemberOrderPayProvider>(
        create: (context) => MemberOrderPayProvider.instance(),
        child: Consumer<MemberOrderPayProvider>(
          builder: (context, viewModel, child) {
            return Scaffold(
              //backgroundColor: Color(0xfff2eeeb),
              appBar: AppBar(
                title: Text('支付选择'),
              ),
              body: ListView(
                children: <Widget>[
                  Container(
                    height: 40,
                    color: Colors.red,
                    child: Row(
                      children: <Widget>[Icon(Icons.play_arrow, color: Colors.white), Text('活动火爆,请在十五分钟内完成支付', style: TextStyle(color: Colors.white))],
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(height: 0.5),
                  Container(
                    height: 50,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Center(child: Text('支付编号')),
                          Center(child: Text('${info.orderunique}', style: TextStyle(color: Colors.black87))),
                        ],
                      ),
                    ),
                  ),
                  Divider(height: 0.5),
                  Container(
                    height: 50,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Center(child: Text('商品金额')),
                          Center(child: Text('¥${info.totalMoney}', style: TextStyle(color: Colors.red))),
                        ],
                      ),
                    ),
                  ),
                  Divider(height: 0.5),
                  Container(
                    height: 50,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Center(child: Text('运费')),
                          Center(child: Text('¥0.00', style: TextStyle(color: Colors.red))),
                        ],
                      ),
                    ),
                  ),
                  Divider(height: 0.5),
                  Container(
                    height: 50,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Center(child: Text('应付金额')),
                          Center(child: Text('¥${info.totalMoney}', style: TextStyle(color: Colors.red))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // ...viewModel.data.data.payments.map((payments) => paylist(payments)),
                  //  ...viewModel.data.data.payments.map((payments) => paylist(payments)),
                  paylist(info.payments)
                ],
              ),
              bottomNavigationBar: SafeArea(
                child: Container(
                  height: 50,
                  decoration: new BoxDecoration(
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.black, //阴影颜色
                        // blurRadius: 2.0, //阴影大小
                      ),
                    ],
                    color: Colors.white, //设置圆角
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Divider(height: 0.5)
                      Row(
                        children: <Widget>[
                          //Icon(Icons.departure_board),
                          //  Text('全选')
                        ],
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text('合计:'),
                            Text('¥${info.totalMoney}', style: TextStyle(color: Colors.pink)),
                            SizedBox(width: 5),
                            Container(
                              color: Colors.red,
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () async {
                                  ConfirmOrderClass data;
                                  // payCode = Provide.value<GetCartListP>(context).payCode;
                                  //print(payCode);
                                  if (payFrom == null) {
                                    await Get.dialog(Center(
                                      child: Text("请选择支付方式"),
                                    ));
                                    return;
                                  }
                                  // zf(data.data.data.userAddress.addressId, widget.source);

                                  //////
                                  var formData = {
                                    "order_no": info.orderunique,
                                    "pay_from": payFrom,
                                  };
                                  await requestPost('Payments', formData: formData).then((val) {
                                    data = ConfirmOrderClass.fromJson(val);
                                  });
                                  if (data.status == -1) {
                                    await Get.dialog(Center(
                                      child: Text(data.msg),
                                    ));
                                    payFrom = null;

                                    Get.to(IndexPageView());
                                  } else {
                                    await Get.dialog(Center(
                                      child: Text(data.msg),
                                    ));
                                    payFrom = null;
                                    Get.to(IndexPageView());
                                  }
                                  print(payFrom);
                                },
                                child: Center(child: Text('去支付')),
                              ),
                              height: MediaQuery.of(context).size.height,
                              width: 100,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget paylist(payments) {
    return ChangeNotifierProvider<MemberOrderPayChangeProvider>(
        create: (context) => MemberOrderPayChangeProvider.instance(),
        child: Consumer<MemberOrderPayChangeProvider>(
          builder: (context, viewModel, child) {
            return Column(
              children: <Widget>[
                ...payments.map((payments) => Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          color: Colors.white,
                          child: RadioListTile(
                            value: payments.id,
                            groupValue: viewModel.groupValueb,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[SizedBox(width: 5), Text(payments.payName)],
                                ),
                              ],
                            ),
                            onChanged: (value) {
                              viewModel.changeValue(value, payments.payFrom);
                              // Provide.value<GetCartListP>(context).payCode = payments.payCode;
                              payvalue = value;
                              payFrom = payments.payFrom;

                              print(payments.payFrom);
                              //  Provide.value<GetCartListP>(context).changePayValue(value);
                            },
                          ),
                        ),
                        Divider(height: 0.5)
                      ],
                    )),
              ],
            );
          },
        ));
  }
}
