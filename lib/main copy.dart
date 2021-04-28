import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xshop/IndexPage/IndexPageView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       navigatorKey: Get.key,
   theme: ThemeData(
          primarySwatch: Colors.red, primaryColor: Colors.white), //设置App主题
      home: IndexPageView(),
    );
  }
}
