import 'package:dio/dio.dart';

///Debug 日志工具类
class DebugLogUtil {
  static final isDebug = true;

  static printLog(String log, {tag = 'DebugUtil'}) {
    if (isDebug) {
      print('$tag : $log');
    }
  }

  ///打印 网络回调信息
  static printHttp(Response response) {
//    DebugLogUtil.printLog('http request:${response.request.method}',
//        tag: 'HttpUtil');
    DebugLogUtil.printLog('http statusCode:${response.statusCode}',
        tag: 'HttpUtil');
    DebugLogUtil.printLog('http statusMessage:${response.statusMessage}',
        tag: 'HttpUtil');
    DebugLogUtil.printLog('http data:${response.data}', tag: 'HttpUtil');
  }
}
