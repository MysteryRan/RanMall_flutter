import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'dart:convert';



class HttpRequest {
  // md5 加密
  // String _generateMd5(String data) {
  //   var content = new Utf8Encoder().convert('10086' + data);
  //   var digest = md5.convert(content);
  //   // 这里其实就是 digest.toString()
  //   return hex.encode(digest.bytes);
  // }
  // 内部自己调用自己
  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static Map<String, dynamic> optionsHeaders = {'Content-Type':'application/json; charset=utf-8',
                                                'Accept': '*/*',
                                                'Mall-Id': 42,
                                                'update':true,
                                                'source':'xcx',};

  static final BaseOptions baseOptions = BaseOptions(connectTimeout: 5000, headers: optionsHeaders);
  static final Dio dio = Dio(baseOptions);
  // 异步编程 padding complete
  static Future<T> request<T>(String url, {
                      String method = "get",
                      Map<String, dynamic> params,
                      Interceptor inter}) async {
    // 1.创建单独配置
    final options = Options(method: method);
    // options.headers = {'token': HttpRequest()._generateMd5('R5Nls5LxYFUiEew.NO/NIiE+A5FWrJMT')};

    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (options) {
        return options;
      },
      onResponse: (response) {
        return response;
      },
      onError: (err) {
        return err;
      }
    );

    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);

    // 2.发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }


  static Future<T> six6dRequest<T>(String url, {
                      String method = "get",
                      Map<String, dynamic> params,
                      Interceptor inter}) async {
    // 1.创建单独配置
    final options = Options(method: method);
    // options.headers = {'token': HttpRequest()._generateMd5('R5Nls5LxYFUiEew.NO/NIiE+A5FWrJMT')};

    List<String> paramsKeys = [];

    String paddingUrl = 'L8q{b=fk=4aJ3jM#cBDE8SaZ_A;bWAG]';
    // paramsKeys = params.keys;
    if (params != null) {
        for (var key in params.keys) {
          paramsKeys.add(key);
       }
        paramsKeys.sort();
        for (var item in paramsKeys) {
          paddingUrl += params[item].toString();
        }
    }
    

    String newUrl = url + generateMd5(paddingUrl);
    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (options) {
        return options;
      },
      onResponse: (response) {
        return response;
      },
      onError: (err) {
        return err;
      }
    );

    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }
    
    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);
    // 2.发送网络请求
    try {
      Response response = await dio.request(newUrl, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}