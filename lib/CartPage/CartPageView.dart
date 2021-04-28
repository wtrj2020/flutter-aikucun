import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xshop/CartPage/CartPageProvider.dart';
import 'package:xshop/CartPageAddress/CartPageAddressView.dart';
import 'package:xshop/CartPagePay/CartPagePayVIew.dart';
import 'package:xshop/Class/CartPageClass.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartPageProvider>(
      create: (context) => CartPageProvider.instance(),
      child: Consumer<CartPageProvider>(builder: (context, viewModel, child) {
        return FutureBuilder(
            future: viewModel.request(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (viewModel.data.data.length == 0) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text("购物车"),
                      elevation: 0,
                      centerTitle: true,
                    ),
                    body: Center(
                      child: Text("购物车为空"),
                    ),
                  );
                } else {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text("购物车"),
                      elevation: 0,
                      centerTitle: true,
                    ),
                    body: ListView(
                      children: <Widget>[
                        addressCart(context, viewModel.data),
                        Column(children: <Widget>[
                          ...viewModel.data.data.map((carts) => Card(
                                //elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[Image.asset('lib/assets/icons/dianpu.png', width: 20, height: 20, color: Colors.pink), SizedBox(width: 10), Text(carts.shopName)],
                                      ),
                                      Divider(),
                                      Column(children: <Widget>[
                                        ...carts.listx.map((list) => Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    //Icon(Icons.local_see, size: 120),
                                                    Padding(
                                                      padding: const EdgeInsets.all(6.0),
                                                      child: Image.network(list.goodsImg, width: 70),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Container(
                                                            width: 220,
                                                            child: Text(
                                                              list.goodsName,
                                                              maxLines: 1,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(fontSize: 15),
                                                            )),
                                                        Text('款号:${list.goodsSn};' ' 单价:${list.goodsPrice}'),
                                                        Text('规格:${list.specName}'),
                                                        // Text('单价:${list.specPrice}'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      //behavior: HitTestBehavior.translucent,
                                                      child: Text('删除', style: TextStyle(fontSize: 12, color: Colors.black26)),
                                                      onTap: () {
                                                        //Vibrate.feedback(_type);
                                                        print(list.cartId);
                                                        viewModel.delCart(list.cartId);

                                                        Get.snackbar('提示', '删除成功');

                                                        // Provide.value<GetCartListP>(context).delCart(list.cartId);
                                                        // Scaffold.of(context).showSnackBar(// 打开操作提示栏
                                                        //     SnackBar(
                                                        //   content: Text('删除完成'),
                                                        //   action: SnackBarAction(label: '', onPressed: () {}),
                                                        // ));
                                                      },
                                                    ),
                                                    SizedBox(height: 20),
                                                    Container(
                                                      decoration: new BoxDecoration(
                                                        shape: BoxShape.rectangle,
                                                        borderRadius: BorderRadius.circular(5),
                                                        border: Border.all(color: Color(0x33333333)),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          // GestureDetector(
                                                          //   behavior: HitTestBehavior.translucent,
                                                          //   onTap: () {
                                                          //     list.cartNum--;
                                                          //     //  Vibrate.feedback(_type);

                                                          //     //   Provide.value<GetCartListP>(context).changeCartGoods(list.cartId, list.cartNum);
                                                          //   },
                                                          //   child: Row(
                                                          //     children: <Widget>[
                                                          //       SizedBox(width: 5),
                                                          //       Icon(
                                                          //         Icons.remove,
                                                          //         color: Color(0xff888888),
                                                          //       ),
                                                          //     ],
                                                          //   ),
                                                          // ),
                                                          Container(
                                                            width: 30,
                                                            child: Center(
                                                              child: Text(
                                                                list.cartNum.toString(),
                                                                style: TextStyle(color: Color(0xff333333), fontSize: 15),
                                                              ),
                                                            ),
                                                          ),
                                                          // GestureDetector(
                                                          //   behavior: HitTestBehavior.translucent,
                                                          //   onTap: () {
                                                          //     list.cartNum++;
                                                          //     //Vibrate.feedback(_type);

                                                          //     // Provide.value<GetCartListP>(context).changeCartGoods(list.cartId, list.cartNum);
                                                          //   },
                                                          //   child: Row(
                                                          //     children: <Widget>[
                                                          //       Icon(
                                                          //         Icons.add,
                                                          //         color: Color(0xff888888),
                                                          //       ),
                                                          //       SizedBox(width: 5)
                                                          //     ],
                                                          //   ),
                                                          // )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('运费:'),
                                            Text('¥0.00', style: TextStyle(color: Colors.pink)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('合计(含运费):'),
                                            Text('¥${carts.shopPrice}', style: TextStyle(color: Colors.pink)),
                                          ],
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ))
                        ]),
                      ],
                    ),
                    bottomNavigationBar: Container(
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
                          Row(
                            children: <Widget>[
                              //Text('合计:'),
                              //Text('¥999', style: TextStyle(color: Colors.pink)),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  Get.to(CartPagePayView(), opaque: true, transition: Transition.fade);

                                  // if (data.data.data.userAddress.addressId == 123123) {
                                  //  // errDialog('填写收货地址');
                                  //   //Navigator.of(context).push(MaterialPageRoute(builder: (context) => new AddressListPage()));
                                  //   return;
                                  // }
                                  // print('object');
                                  // Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new PayPage(source: 1)));
                                },
                                child: Container(
                                  color: Colors.red,
                                  child: Center(child: Text('结算')),
                                  height: MediaQuery.of(context).size.height,
                                  width: 100,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              } else {
                return Scaffold();
              }
            });
      }),
    );
  }

  Widget addressCart(context, CartPageClass data) {
    if (data.data[0].userAddress.addressId != 0) {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.to(CartPageAddressView(), opaque: true, transition: Transition.fade);

                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => new AddressListPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset('lib/assets/map.png', width: 25, height: 25),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  data.data[0].userAddress.userName,
                                  style: TextStyle(fontSize: 22, color: Colors.black),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  data.data[0].userAddress.userPhone,
                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                )
                              ],
                            ),
                            Text(
                              data.data[0].userAddress.userAddress,
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.chevron_right, color: Colors.black45)
                    //  Image.asset('assets/icons/daifukuan.png', width: 30, height: 30, color: Colors.pink),
                  ],
                ),
              ),
            ),
          ),
          Image.asset('lib/assets/1.jpg', width: MediaQuery.of(context).size.width),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
              color: Colors.white,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  Get.to(CartPageAddressView(), opaque: false, transition: Transition.fade);
                  //await Navigator.of(context).push(MaterialPageRoute(builder: (context) => new AddressListPage()));
                },
                child: Container(
                  height: 100,
                  child: Center(
                    child: Text(
                      '你还没有填写收货地址>>',
                      style: TextStyle(fontSize: 22, color: Colors.red),
                    ),
                  ),
                ),
              )),
          Image.asset('assets/icons/1.jpg', width: MediaQuery.of(context).size.width),
        ],
      );
    }
  }
}
