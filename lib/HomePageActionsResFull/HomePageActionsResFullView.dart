import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:xshop/Class/ActionsListClass.dart';
import 'package:xshop/HomePageActionsResFull/HomePageActionsResFullProvider.dart';

// import controller

class HomePageActionsResFullView extends StatelessWidget {
   final Data items;
  const HomePageActionsResFullView({Key key,  this.items})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageActionsResFullProvider>(
      create: (context) => HomePageActionsResFullProvider.instance(),
      child: Consumer<HomePageActionsResFullProvider>(
        builder: (context, viewModel, child) {
          return FutureBuilder(
            future: viewModel.request(this.items.themeId, 0, 0, 0, 0, 0),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  //backgroundColor: Color(0xfff2eeeb),
                  appBar: AppBar(
                    elevation: 0,
                    title: Text(this.items.themeName),
                    //backgroundColor: Colors.white,
                  ),
                  body: ListView.builder(
                    itemCount: viewModel.data.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Image.network(viewModel.data.data[index].goodsImg,
                                  width: 80, height: 80, fit: BoxFit.cover),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width -
                                          200,
                                      child: Text(
                                        viewModel.data.data[index].goodsName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  Text(
                                      '供货价：¥${viewModel.data.data[index].goodsPrice}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                  SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text('含代价：'),
                                          Container(
                                            width: 80,
                                            child: Text(
                                                '¥${viewModel.data.data[index].goodsPrice}',
                                                style: TextStyle(
                                                    color: Colors.pink)),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(width: 50,),
                                      Container(
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(
                                              color: Color(0x33333333)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            GestureDetector(
                                              behavior:
                                                  HitTestBehavior.translucent,
                                              onTap: () {
                                                // sub(index);
                                              },
                                              child: Row(
                                                children: <Widget>[
                                                  SizedBox(width: 5),
                                                  Icon(
                                                    Icons.remove,
                                                    color: Color(0xff888888),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              child: Center(
                                                child: Text(
                                                  viewModel.data.data[index]
                                                      .goodsPrice
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Color(0xff333333),
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              behavior:
                                                  HitTestBehavior.translucent,
                                              onTap: () {
                                                // add(index);
                                              },
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.add,
                                                    color: Color(0xff888888),
                                                  ),
                                                  SizedBox(width: 5)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text('批量加价', style: TextStyle(fontSize: 18)),
                                SizedBox(width: 10),
                                Container(
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(3),
                                    border:
                                        Border.all(color: Color(0x33333333)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {},
                                        child: Row(
                                          children: <Widget>[
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.remove,
                                              color: Color(0xff888888),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            "asdadas",
                                            style: TextStyle(
                                                color: Color(0xff333333),
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {},
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.add,
                                              color: Color(0xff888888),
                                            ),
                                            SizedBox(width: 5)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () async {},
                                child: Container(
                                  color: Colors.red,
                                  child: Center(child: Text('转播全场')),
                                  height: MediaQuery.of(context).size.height,
                                  width: 100,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Scaffold();
              }
            },
          );
        },
      ),
    );
  }


  String formatDuration(Duration d) {
    String f(int n) {
      return n.toString().padLeft(2, '0');
    }

    String f1(int n) {
      return n.toString().padLeft(1, '0');
    }

    return "${f1(d.inDays)}天 ${f(d.inHours % 24)}:${f(d.inMinutes % 60)}:${f(d.inSeconds % 60)}";
  }
}

class ViewImages extends StatelessWidget {
  final List images;
  final int initialPage;
  const ViewImages({Key key, this.images, this.initialPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: PageIndicatorContainer(
        indicatorSpace: 20.0,
        padding: const EdgeInsets.all(50),
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Colors.white,
        shape: IndicatorShape.circle(size: 12),
        length: images.length,
        child: PageView.builder(
            controller: PageController(initialPage: initialPage),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onPanEnd: (e) => Navigator.pop(context),
                  onTap: () => Navigator.pop(context),
                  child: Image.network(
                    images[index],
                    //errorWidget: (context, url, error) => new Icon(Icons.error),
                    //imageUrl: images[index],
                    fit: BoxFit.none,
                  ));
            }),
      ),
    );
  }
}
