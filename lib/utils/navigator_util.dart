import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/scheme_util.dart';

import '../web_page.dart';

class NavigatorUtil {
  //跳转界面
  static jumpPage(BuildContext context, page) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (buildContext) => page));

  //跳转界面 并在任务栈 移除
  static jumpReplacePage(BuildContext context, page) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (buildContext) => page));

  //跳转界面并有返回值返回
  static dynamic jumpPageGetData(BuildContext context, page) async =>
      await jumpPage(context, page);

  //跳转 webView
  static jumpWeb(BuildContext context, String webUrl) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (buildContext) => WebViewPage(
                webUrl: webUrl,
                webTitle: '简书',
              )));

  /// 执行页面跳转
  static void push(BuildContext context, String url) {
    if(url.startsWith('http')){
      jumpWeb(context, url);
      return;
    }
    Map<String, dynamic> urlParseRet = SchemeUtil.parseUrl(url);
    Navigator.pushNamedAndRemoveUntil(context, urlParseRet['action'].toString(),
            (route) {
          if (route.settings.name == urlParseRet['action'].toString()) {
            return false;
          }
          return true;
        }, arguments: urlParseRet['params']);
  }
}
