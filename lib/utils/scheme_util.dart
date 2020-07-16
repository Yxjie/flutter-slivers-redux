import 'package:flutter/material.dart';
///定义Scheme 跳转方式
class SchemeUtil {
  ///flutter_app://userPageIndex?userId=1001
  static final String appScheme = 'flutter_app';

  /// 解析跳转的url，并且分析其内部参数
 static Map<String, dynamic> parseUrl(String url) {
    if (url.startsWith(appScheme)) {
      url = url.substring(appScheme.length+3);
    }
    int placeIndex = url.indexOf('?');
    if (url == '' || url == null) {
      return {'action': '/', 'params': null};
    }
    if (placeIndex < 0) {
      return {'action': url, 'params': null};
    }
    String action = url.substring(0, placeIndex);
    String paramStr = url.substring(placeIndex + 1);
    if (paramStr == null) {
      return {'action': action, 'params': null};
    }
    Map params = {};
    List<String> paramsStrArr = paramStr.split('&');
    for (String singleParamsStr in paramsStrArr) {
      List<String> singleParamsArr = singleParamsStr.split('=');
      params[singleParamsArr[0]] = singleParamsArr[1];
    }
    return {'action': action, 'params': params};
  }


}
