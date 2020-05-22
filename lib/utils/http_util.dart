import 'dart:io';
import 'package:dio/adapter.dart';
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
      ..interceptors.add(InterceptorsWrapper(onRequest: (req) async {
        //请求头添加
        req.headers['User-Agent'] =
            'Autoyol_98:Android_28|2FC850F4BC5FFE2C534C71B632228226D30A340D04EA012E90D0139C1C';
        req.headers['Content-Type'] = 'application/json; charset=utf-8';
        req.headers['Accept'] = 'application/json;version=3.0;compress=false';
        return req;
      }, onResponse: (resp) async {
        DebugLogUtil.printHttp(resp);
//        DebugLogUtil.printLog(resp.data.toString(), tag: 'HttpUtil');
        return resp.data;
      }, onError: (DioError error) async {
        _formatError(error);
      }));

    //设置证书
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      //忽略所有证书
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }

  ///error统一处理
  _formatError(DioError error) {
    if (error.type == DioErrorType.CONNECT_TIMEOUT) {
      DebugLogUtil.printLog("连接超时${error.message}", tag: 'HttpUtil');
    } else if (error.type == DioErrorType.SEND_TIMEOUT) {
      DebugLogUtil.printLog("请求超时${error.message}", tag: 'HttpUtil');
    } else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
      DebugLogUtil.printLog("响应超时${error.message}", tag: 'HttpUtil');
    } else if (error.type == DioErrorType.RESPONSE) {
      DebugLogUtil.printLog("出现异常${error.message}", tag: 'HttpUtil');
    } else if (error.type == DioErrorType.CANCEL) {
      DebugLogUtil.printLog("请求取消:${error.message}", tag: 'HttpUtil');
    } else {
      DebugLogUtil.printLog('其他异常:${error.toString()}', tag: 'HttpUtil');
    }
  }

  ///Get 请求
  Future<Map<String, dynamic>> fetchGet(String urlPath,
      {Map<String, dynamic> queryParameters, CancelToken cancelToken}) async {
    Response response = await _dio.get(urlPath,
        queryParameters: queryParameters, cancelToken: cancelToken);
//    DebugLogUtil.printHttp(response);
    return response.data;
  }

  ///Post 请求
  Future<Map<String, dynamic>> fetchPost(String urlPath,
      {Map<String, dynamic> params, CancelToken cancelToken}) async {
    Response response = await _dio.post(urlPath,
        queryParameters: params, cancelToken: cancelToken);
//    DebugLogUtil.printHttp(response);
    return response.data;
  }

  ///Post 表单请求
  Future<Map<String, dynamic>> fetchPostByForm(
      String urlPath, Map<String, dynamic> forms,
      {CancelToken cancelToken}) async {
    final formData = FormData.fromMap(forms);
    Response response =
        await _dio.post(urlPath, data: formData, cancelToken: cancelToken);
//    DebugLogUtil.printHttp(response);
    return response.data;
  }

  ///Download File
  fetchDownload(String urlPath, dynamic savePath,
      {CancelToken cancelToken}) async {
    Response response =
        await _dio.download(urlPath, savePath, cancelToken: cancelToken);
//    DebugLogUtil.printHttp(response);
    return response.data;
  }

  ///取消请求
  cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
