 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xshop/Common/SliverAppBarDelegate.dart';
import 'package:xshop/HomePageActions/HomePageActionsView.dart';

import 'HomePageCatsProvider.dart';
 

class HomePageCatsView extends StatefulWidget {
  final String actStatusName;
  final int actStatus;
  const HomePageCatsView({Key key, this.actStatusName, this.actStatus})
      : super(key: key);

  @override
  _HomePageCatsViewState createState() => _HomePageCatsViewState();
}

class _HomePageCatsViewState extends State<HomePageCatsView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  /*保证页面的活跃*/
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageCatsProvider>(
      create: (context) => HomePageCatsProvider.instance(),
      child: Consumer<HomePageCatsProvider>(
        builder: (context, viewModel, child) {
          return FutureBuilder(
              future:viewModel.request(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<Widget> tabBardata = [
                    ...viewModel.data.data
                        .map((data) => Text(data.catName))
                        .toList()
                  ];
                  return DefaultTabController(
                    length: tabBardata.length,
                    child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverPersistentHeader(
                              pinned: true,
                              delegate: SliverAppBarDelegate(
                                minHeight: 40.0,
                                maxHeight: 25.0,
                                child: Container(
                                  color: Colors.grey[50],
                                  child: Center(
                                    child: TabBar(
                                      isScrollable: true,
                                      indicatorColor: Colors.pink,
                                      labelColor: Colors.black87,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      labelStyle: TextStyle(fontSize: 16),
                                      unselectedLabelColor: Colors.black54,
                                      tabs: tabBardata,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ];
                        },
                        body: TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                              ...viewModel.data.data
                                  .map((data) => HomePageActionsView(catId: data.id,actStatus:widget.actStatus)),
                                 // .map((data) => Text("ddwdwdw")),
                            ])),
                  );
                } else {
                  return Container();
                }
              });
        },
      ),
    );
  }
}
