import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/demo/round_path_test.dart';
import 'package:flutter_list_rdux/mvp/login/login_page.dart';
import 'package:flutter_list_rdux/splase_page.dart';

///参考网址定义：http://www.jspkongjian.com/news.jsp?id=1496
///路由相关类
class AppRoute {
  ///定义路由表
  static final Map<String, WidgetBuilder> registerRoutes = {
    '/': (context) => SplashPage(),
    'login': (context) => LoginPage(),
    RoundPathTest.routerName: (context) => RoundPathTest(),
  };

  ///获取传进参
  static Object argument(BuildContext context) {
    return ModalRoute.of(context).settings.arguments;
  }

  ///路由表跳转传参数arguments处理
  static RouteFactory onGenerateRoute = (RouteSettings settings) {
    //统一处理：
    final String name = settings.name;
    final Function pageContentBuilder = registerRoutes[name];
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
    //定义一个空白界面
    return MaterialPageRoute(builder: (context) => NotFoundPage());
  };
}

///空白页
class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Not Found Page',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
