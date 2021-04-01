

import 'package:dio/dio.dart';
import 'dart:convert';


Future requestData(String path, {dynamic formdata}) async {
  try {
    Response resonse;

    Dio dio = Dio();

   
    dio.options.contentType = Headers.jsonContentType;
    dio.options.connectTimeout = 15000; //连接服务器超时时间，单位是毫秒.
    dio.options.receiveTimeout =
        3000; //响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过receiveTimeout将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.

 
    resonse = await dio.post(path, data: formdata);

    if (resonse.statusCode == 200) {
      print('############# $path ################');

      print(json.encode(resonse.data));

        print('#############################');

      return  resonse.data;
    } else {
      throw Exception('后端接口报错');
    }
  } catch (e) {
    return print('Eror ===== $e');
  }
}
