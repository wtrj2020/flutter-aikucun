import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:xshop/Class/ActionsListClass.dart';
import 'package:xshop/HomePageActions/HomePageActionsProvider.dart';
import 'package:xshop/HomePageActionsDetailsl/HomePageActionsDetailslView.dart';
import 'package:xshop/HomePageActionsResFull/HomePageActionsResFullView.dart';

// import controller

class HomePageActionsView extends StatelessWidget {
  final int catId;
  final int actStatus;
  const HomePageActionsView({Key key, this.catId, this.actStatus}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageActionsProvider>(
      create: (context) => HomePageActionsProvider.instance(),
      child: Consumer<HomePageActionsProvider>(
        builder: (context, viewModel, child) {
          return FutureBuilder(
            future: viewModel.request(this.actStatus, this.catId, 0, 0, 0),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    ...viewModel.data.data.map((_item) => cards(_item)),
                  ],
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

  Widget cards(Data _item) {
    DateTime alert;
    int djs;
    var nowtime = int.parse(DateTime.now().millisecondsSinceEpoch.toString().substring(0, 10));
    if (_item.actStatus == 2) {
      djs = (_item.actStart) - nowtime;
    } else {
      djs = (_item.actEnd) - nowtime;
    }

    alert = DateTime.now().add(Duration(seconds: djs));
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
      child: Card(
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.network(_item.goodsImgsArray[0], width: 40, height: 40),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_item.themeName, style: TextStyle(fontWeight: FontWeight.w700)),
                        SelectableText(
                          _item.themeNotice,
                          maxLines: 1,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SelectableText(_item.themeNotice, textAlign: TextAlign.start),
              SizedBox(
                height: 130,
                child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                  ..._item.goodsImgsArray.map(
                    (img) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: GestureDetector(
                          onTap: () {
                            //Get.to(ViewImages(_item.goodsImgsArray,_item.goodsImgsArray.indexOf(img)));
                            Get.to(
                                ViewImages(
                                  images: _item.goodsImgsArray,
                                  initialPage: _item.goodsImgsArray.indexOf(img),
                                ),
                                opaque: false,
                                transition: Transition.fade);
                          },
                          child: Image.network(
                            img,
                            height: 110,
                            width: 130,
                            // imageUrl: img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TimerBuilder.scheduled([alert], builder: (context) {
                    return TimerBuilder.periodic(Duration(seconds: 1), alignment: Duration.zero, builder: (context) {
                      var now = DateTime.now();
                      var remaining = alert.difference(now);
                      if (_item.actStatus == 2) {
                        return Text('距开始${formatDuration(remaining)}', style: TextStyle(color: Colors.black54));
                      } else {
                        return Text('距结束${formatDuration(remaining)}', style: TextStyle(color: Colors.red));
                      }
                    });
                  }),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 27,
                        child: OutlineButton(
                          borderSide: new BorderSide(color: Colors.pink),
                          textColor: Colors.pink,
                          child: new Text('转播全场'),
                          onPressed: () => Get.to(HomePageActionsResFullView(items: _item), opaque: false),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 27,
                        child: FlatButton(
                          color: Colors.pink,
                          textColor: Colors.white,
                          child: Text('去抢购'),
                          onPressed: () => Get.to(HomePageActionsDetailslView(items: _item), opaque: false),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
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
