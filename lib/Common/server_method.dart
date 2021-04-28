import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'httpHeaders.dart';
import 'server_config.dart';

Future requestPost(url, {formData}) async {
  try {
    print('\n------post----------------------------------');
    print(jsonEncode(formData));
    print('post:请求url:${serverPath[url]}\n');
    print('-------end------------------------------------------\n\n');

    Response response;
    Dio dio = new Dio();
    dio.options.headers = httpHeaders;
   // dio.options.headers['Content-Type'] = 'application/json';
    //dio.options.headers['token'] = '5f2d65e1bbfb926e681436a6ddf5d9b1';
    if (formData == null) {
      response = await dio.post(serverPath[url]);
    } else {
      response = await dio.post(serverPath[url], data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      //throw Exception('后端接口出现异常。');
    }
  } catch (e) {
    return print('发生错误:=====$e');
  }
}

Future requestGet(url, {formData}) async {
  try {
    print('\n------get----------------------------------');
    print(jsonEncode(formData));
    print('get:请求url:${serverPath[url]}\n');
    print('-------end------------------------------------------\n\n');

    Response response;
    Dio dio = new Dio();
    dio.options.headers = httpHeaders;
    //dio.options.headers['Content-Type'] = 'application/json';
    //dio.options.headers['token'] = "5f2d65e1bbfb926e681436a6ddf5d9b1";
    response = await dio.get(serverPath[url]);
//print(response);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常。');
    }
  } catch (e) {
    return print('发生错误:=====$e');
  }
}
