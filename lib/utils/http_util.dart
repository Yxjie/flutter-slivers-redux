import 'dart:io';

import 'package:dio/dio.dart';

///网络请求封装
class HttpUtil {
  static final String baseUrl = "";

  static HttpUtil _instance;

  static HttpUtil _getInstance() => _instance ?? HttpUtil._internal();

  //通过单列获取HttpUtil对象
  static get INSTANCE => _getInstance();

  Dio _dio;

  ///私有构造方法
  HttpUtil._internal() {
    _dio = Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..interceptors.add(InterceptorsWrapper(onRequest: (req) {
        req.headers['User-Agent'] =
            'Autoyol_98:Android_28|2FC850F4BC5FFE2C534C71B632228226D30A340D04EA012E90D0139C1C';
        req.headers['Content-Type'] = 'application/json; charset=utf-8';
        req.headers['Accept'] = 'application/json;version=3.0;compress=false';
        return req;
      }, onResponse: (resp) {
        return resp.data;
      }, onError: (error) {
        print(error.toString());
      }));

    //设置证书
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (c) {
      //忽略所有证书
      c.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }

  ///Get 请求
  Future<Map<String, dynamic>> fetchGet(String urlPath,
      {Map<String, dynamic> queryParameters}) async {
    Response response =
        await _dio.get(urlPath, queryParameters: queryParameters);
    return response.data;
  }

  ///Post 请求
  Future<Map<String, dynamic>> fetchPost(String urlPath,
      {Map<String, dynamic> params}) async {
    Response response = await _dio.post(urlPath, queryParameters: params);
    return response.data;
  }

  ///Post 表单请求
  Future<Map<String, dynamic>> fetchPostByForm(
      String urlPath, Map<String, dynamic> forms) async {
    final formData = FormData.from(forms);
    Response response = await _dio.post(urlPath, data: formData);
    return response.data;
  }

  ///Download File
  fetchDownload(String urlPath, dynamic savePath) async {
    Response response = await _dio.download(urlPath, savePath);
    return response.data;
  }
}
