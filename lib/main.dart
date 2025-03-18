import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';

import 'utils/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugProfileBuildsEnabled = true;
  //app只能竖屏模式
  CommonUtil.instance.screenOrientation(ScreenOrientation.Portrait);
//  SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //透明状态栏
  if (Platform.isAndroid) {
    final systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  //初始化PackageUtil
  PackageUtil.init();
  //JPush init
  // JPushManager.instance.setupAlias('Yxjie');
  //
  // if (Platform.isIOS) {
  //   // ignore: unnecessary_statements
  //   JPushManager.instance.applyJPushAuthorityIOS;
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter框架',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          //定义光标颜色
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.deepOrange,
          )
//        textTheme: TextTheme(
//          body1: TextStyle(
//            fontFamily: 'Barriecito',
//          )
//        )
          ),
      initialRoute: '/',
      routes: AppRoute.registerRoutes,
      onGenerateRoute: AppRoute.onGenerateRoute,
//      home: SplashPage(),
    );
  }
}
