import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

///通用工具类
class CommonUtil {
  static CommonUtil _instance;

  static CommonUtil _getInstance() {
    return _instance ?? CommonUtil._internal();
  }

  static CommonUtil get INSTANCE => _getInstance();

  ///私有构造方法
  CommonUtil._internal();

  ///不满足条件 就抛异常
  throwIfNot(bool condition, [String message]) {
    if (!condition) {
      throw ArgumentError(message);
    }
  }

  ///获取屏幕宽度
  screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  ///获取屏幕高度
  screenHeight(BuildContext context) => MediaQuery.of(context).size.height;


}
