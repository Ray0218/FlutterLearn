import 'dart:convert';

import 'package:dio/dio.dart';
import '../config/service_url.dart';
import 'dart:async';

//获取首页主题内容

Future getHomePageContent() async {
  try {
    Response resonse;

    Dio dio = Dio();

    //  dio.options.contentType =
    // ContentType.parse('application/x-www-form-urlencoded').toString();
    dio.options.contentType = Headers.formUrlEncodedContentType;

    var formData = {'lon': '115.02932', 'lat': '35.76189'};

    resonse = await dio.post(serviePath['homePageContent'], data: formData);

    if (resonse.statusCode == 200) {
      return resonse.data;
    } else {
      throw Exception('后端接口报错');
    }
  } catch (e) {
     print(e);
    return e;
  }
}

Future requestData(String path, {dynamic formdata}) async {
  try {
    Response resonse;

    Dio dio = Dio();

    //  dio.options.contentType =
    // ContentType.parse('application/x-www-form-urlencoded').toString();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.connectTimeout = 15000; //连接服务器超时时间，单位是毫秒.
    dio.options.receiveTimeout =
        3000; //响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过receiveTimeout将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.

    // var formData = {'lon': '115.02932', 'lat': '35.76189'};

    resonse = await dio.post(path, data: formdata);

    if (resonse.statusCode == 200) {
      // print('############# $path ################');

      // print(resonse.data);

      // print('#############################');

      return json.decode(resonse.data);
    } else {
      throw Exception('后端接口报错');
    }
  } catch (e) {
    return print('Eror ===== $e');
  }
}
