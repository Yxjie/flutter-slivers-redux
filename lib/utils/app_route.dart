import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/mvp/login/login_page.dart';
import 'package:flutter_list_rdux/splase_page.dart';

///参考网址定义：http://www.jspkongjian.com/news.jsp?id=1496
///路由相关类
class AppRoute {
  ///定义路由表
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => SplashPage(),
    'login': (context) => LoginPage(),
  };

  ///路由表跳转传参数arguments处理
  static RouteFactory onGenerateRoute = (RouteSettings settings) {
    //统一处理：
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
        return route;
      }
    }
    //todo 定义一个空白界面
    return MaterialPageRoute(builder: (context) => null);
  };
}
