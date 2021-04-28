import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xshop/CartPage/CartPageView.dart';
import 'package:xshop/HomePage/HomePageView.dart';
import 'package:xshop/MemberPage/MemberPageView.dart';
import 'IndexPageProvider.dart';
 
class IndexPageView extends StatelessWidget {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
    BottomNavigationBarItem(icon: Icon(Icons.card_travel), title: Text('购物车')),
    BottomNavigationBarItem(icon: Icon(Icons.my_location), title: Text('我的')),
  ];

  final List<Widget> tabList = [
    HomePageView(),
    Text("data"),
    CartPageView(),
    MemberPageView()
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IndexPageProvider>(
      create: (context) => IndexPageProvider.instance(),
      child: Consumer<IndexPageProvider>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: tabList[viewModel.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.pink,
              type: BottomNavigationBarType.fixed,
              currentIndex: viewModel.currentIndex,
              items: items,
              onTap: (int index) {
                viewModel.changeCurrentIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
