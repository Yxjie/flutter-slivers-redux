import 'package:flutter/material.dart';

import '../web_page.dart';

class NavigatorUtil {
  //跳转界面
  static jumpPage(BuildContext context, page) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (buildContext) => page));

  //跳转界面 并在任务栈 移除
  static jumpReplacePage(BuildContext context, page) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (buildContext) => page));

  //跳转界面并有返回值犯规
  static dynamic jumpPageGetData(BuildContext context, page) async =>
      await jumpPage(context, page);

  //跳转 webView
  static jumpWeb(BuildContext context, String webUrl) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (buildContext) => WebViewPage(webUrl: webUrl)));
}
