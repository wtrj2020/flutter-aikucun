import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:xshop/CartPageAddress/CartPageAddressView.dart';
import 'package:xshop/MemberOrderPage/MemberOrderPageView.dart';

import 'MemberPageProvider.dart';

class MemberPageView extends StatelessWidget {
  const MemberPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemberPageProvider>(
        create: (context) => MemberPageProvider.instance(),
        child: Consumer<MemberPageProvider>(
          builder: (context, viewModel, child) {
            return FutureBuilder(
                future: viewModel.request(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Scaffold(
                      backgroundColor: Color(0xff4f5f6),
                      body: CustomScrollView(
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                            child: Container(height: 80, color: Colors.pink),
                          ),
                          SliverFillRemaining(
                            child: Stack(
                              children: <Widget>[
                                Container(height: 50, color: Colors.pink),
                                Column(
                                  children: <Widget>[
                                    Card(
                                      elevation: 1.0, //设置阴影
                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0))), //设置圆角
                                      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      behavior: HitTestBehavior.translucent,
                                                      //onTap: () => getImage(),
                                                      child: ClipOval(
                                                        child: Image.network(
                                                          //data.data.userPhoto.toString(),
                                                          viewModel.data.data.userInfo.headImg,
                                                          width: 60,
                                                          height: 60,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Offstage(
                                                      offstage: true,
                                                      child: SizedBox(
                                                        child: LinearProgressIndicator(),
                                                        height: 8.0,
                                                        width: 100,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 15),
                                                Text(viewModel.data.data.userInfo.userPhone),
                                              ],
                                            ),
                                            Column(
                                              children: <Widget>[
                                                GestureDetector(
                                                    behavior: HitTestBehavior.translucent,
                                                    onTap: () {
                                                      //Navigator.push(context, MaterialPageRoute(builder: (_) => LogMessagesPage()));
                                                    },
                                                    child: Image.asset(
                                                      'lib/assets/xiaoxi.png',
                                                      height: 25,
                                                      width: 25,
                                                      color: Colors.red,
                                                    )),
                                                Text('ID:${viewModel.data.data.userInfo.userId}'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 0.4, //设置阴影
                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))), //设置圆角
                                      color: Colors.white,

                                      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                GestureDetector(
                                                  behavior: HitTestBehavior.translucent,
                                                  onTap: () {
                                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => new LogMoneys()));
                                                  },
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(viewModel.data.data.userInfo.userMoney.toString(), style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w600)),
                                                      SizedBox(height: 9),
                                                      Text('账户余额', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Text(viewModel.data.data.userInfo.lockMoney.toString(), style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w600)),
                                                    SizedBox(height: 9),
                                                    Text('锁定金额', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Text((viewModel.data.data.userInfo.userMoney - viewModel.data.data.userInfo.lockMoney).toString(), style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w600)),
                                                    SizedBox(height: 9),
                                                    Text('可用余额', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Text(viewModel.data.data.userInfo.userScore.toString(), style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w600)),
                                                    SizedBox(height: 9),
                                                    Text('我的积分', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400))
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 0.4, //设置阴影
                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))), //设置圆角
                                      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                GestureDetector(
                                                  //  onTap: ()=>        Navigator.push(context, MaterialPageRoute(builder: (_) => PayPageOK(orderNo: '100006266'))),
                                                  behavior: HitTestBehavior.translucent,
                                                  child: Text('我的订单', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
                                                ),
                                                Text('')
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                                              child: Divider(height: 0.1, indent: 0.0, color: Colors.black12),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                orderbutton(0, '待付款', 'daifukuan', "WaitPay"),
                                                orderbutton(1, '待发货', 'daifahuo', "WaitPay"),
                                                orderbutton(2, '待收货', 'daishouhuo', "WaitPay"),
                                                orderbutton(3, '已完成', 'pingjia', "WaitPay"),
                                                // orderbutton(4, '已取消', 'daifukuan'),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 0.4, //设置阴影
                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))), //设置圆角
                                      margin: EdgeInsets.all(8),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[Text('必备工具', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)), Text('')],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                                              child: Divider(height: 0.1, indent: 0.0, color: Colors.black12),
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[Image.asset('lib/assets/dianpu.png', width: 20, height: 20, color: Colors.lightGreen), SizedBox(height: 9), Text('关注店铺')],
                                                ),
                                                Column(
                                                  children: <Widget>[Image.asset('lib/assets/zuji.png', width: 20, height: 20, color: Colors.cyan), SizedBox(height: 9), Text('我的足迹')],
                                                ),
                                                Column(
                                                  children: <Widget>[Image.asset('lib/assets/zijinlaiyuan.png', width: 20, height: 20, color: Colors.pink), SizedBox(height: 9), Text('资金管理')],
                                                ),
                                                Column(
                                                  children: <Widget>[Image.asset('lib/assets/zijinguanli.png', width: 20, height: 20, color: Colors.pink), SizedBox(height: 9), Text('我的积分')],
                                                )
                                              ],
                                            ),
                                            Padding(padding: const EdgeInsets.only(top: 8, bottom: 8)),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                GestureDetector(
                                                  behavior: HitTestBehavior.translucent,
                                                  //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Tuijian())),
                                                  child: Column(
                                                    children: <Widget>[Image.asset('lib/assets/yaoqinghaoyou.png', width: 20, height: 20, color: Colors.red), SizedBox(height: 9), Text('邀请好友')],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  behavior: HitTestBehavior.translucent,
                                                  //onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => new AddressListPage())),
                                                  onTap: () {
                                                    Get.to(CartPageAddressView(), opaque: false, transition: Transition.fade);
                                                  },
                                                  child: Column(
                                                    children: <Widget>[Image.asset('lib/assets/myaddress.png', width: 20, height: 20, color: Colors.orange), SizedBox(height: 9), Text('地址管理')],
                                                  ),
                                                ),
                                                Column(
                                                  children: <Widget>[Image.asset('lib/assets/zixun.png', width: 20, height: 20, color: Colors.blue), SizedBox(height: 9), Text('客服咨询')],
                                                ),
                                                GestureDetector(
                                                  behavior: HitTestBehavior.translucent,
                                                  // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Webview('订单投诉', serverUrl + 'mobile/ordercomplains/index.html'))),
                                                  child: Column(
                                                    children: <Widget>[Image.asset('lib/assets/tousutiwen.png', width: 20, height: 20, color: Colors.deepOrange), SizedBox(height: 9), Text('订单投诉')],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Scaffold();
                  }
                });
          },
        ));
  }

  orderbutton(int id, String name, String png, String orderStatus) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.to(MemberOrderPageView(orderStatus: orderStatus, id: id), opaque: false);
        //Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) => Webview('我的订单', purl)));
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Column(
              children: <Widget>[Image.asset("lib/assets/" + png + ".png", width: 20, height: 20, color: Colors.orange), SizedBox(height: 9), Text(name)],
            ),
          ),
          // Visibility(
          //   visible: sum > 0 ? true : false,
          //   child: Positioned(
          //     right: 0,
          //     child: ClipOval(
          //         child: Container(
          //       alignment: Alignment.center,
          //       width: 15,
          //       height: 15,
          //       child: Text(sum.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          //       color: Colors.pink,
          //     )),
          //   ),
          // ),
        ],
      ),
    );
  }
}
