import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xshop/HomePageCats/HomePageCatsView.dart';
import 'HomePageProvider.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final List<Widget> bodys = [
    HomePageCatsView(actStatusName: "热播", actStatus: 1),
    HomePageCatsView(actStatusName: "预告", actStatus: 2),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
      create: (context) => HomePageProvider.instance(),
      child: Consumer<HomePageProvider>(
        builder: (context, viewModel, child) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0.3,
                centerTitle: true,
                title: topTabWidget(viewModel),
              ),
              body: TabBarView(
                controller: _tabController,
                physics: new NeverScrollableScrollPhysics(),
                children: this.bodys,
              ),
            ),
          );
        },
      ),
    );
  }

  //topTabWidget
  Widget topTabWidget(HomePageProvider viewModel) {
    print("HomePageLayout-topTabWidget");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _tabController.animateTo(0);
            viewModel.changeTabBarIndex(0);
          },
          child: Container(
            width: 75.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: viewModel.leftColor,
                border: Border.all(color: Colors.red, width: 1.0),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(50.0),
                  bottomLeft: new Radius.circular(50.0),
                )),
            child: Center(
              child: Text(
                '热播',
                style: TextStyle(color: viewModel.leftTextColor, fontSize: 14),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _tabController.animateTo(1);
            viewModel.changeTabBarIndex(1);
          },
          child: Container(
            width: 75.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: viewModel.rightColor,
                border: Border.all(color: Colors.red, width: 1.0),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.only(
                  topRight: new Radius.circular(50.0),
                  bottomRight: new Radius.circular(50.0),
                )),
            child: Center(
              child: Text(
                '预告',
                style: TextStyle(color: viewModel.rightTextColor, fontSize: 14),
              ),
            ),
          ),
        )
      ],
    );
  }
}
