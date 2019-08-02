import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_list_rdux/utils/api.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';

///网络请求封装
class HttpUtil {

  static HttpUtil _instance;

  static HttpUtil _getInstance() => _instance ??= HttpUtil._internal();

  //通过单列获取HttpUtil对象
  static get instance => _getInstance();

  Dio _dio;

  ///私有构造方法
  HttpUtil._internal() {
    _dio = Dio();
    _dio
      ..options.baseUrl = Api.baseUrl
      ..interceptors.add(InterceptorsWrapper(onRequest: (req) {
        //请求头添加
        req.headers['User-Agent'] =
            'Autoyol_98:Android_28|2FC850F4BC5FFE2C534C71B632228226D30A340D04EA012E90D0139C1C';
        req.headers['Content-Type'] = 'application/json; charset=utf-8';
        req.headers['Accept'] = 'application/json;version=3.0;compress=false';
        return req;
      }, onResponse: (resp) {
        DebugLogUtil.printLog(resp.data.toString(), tag: 'HttpUtil');
        return resp.data;
      }, onError: (error) {
        DebugLogUtil.printLog('error:${error.toString()}', tag: 'HttpUtil');
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
    DebugLogUtil.printHttp(response);
    return response.data;
  }

  ///Post 请求
  Future<Map<String, dynamic>> fetchPost(String urlPath,
      {Map<String, dynamic> params}) async {
    Response response = await _dio.post(urlPath, queryParameters: params);
    DebugLogUtil.printHttp(response);
    return response.data;
  }

  ///Post 表单请求
  Future<Map<String, dynamic>> fetchPostByForm(
      String urlPath, Map<String, dynamic> forms) async {
    final formData = FormData.from(forms);
    Response response = await _dio.post(urlPath, data: formData);
    DebugLogUtil.printHttp(response);
    return response.data;
  }

  ///Download File
  fetchDownload(String urlPath, dynamic savePath) async {
    Response response = await _dio.download(urlPath, savePath);
    DebugLogUtil.printHttp(response);
    return response.data;
  }
}
