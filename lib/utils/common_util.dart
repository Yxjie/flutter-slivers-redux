import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_list_rdux/utils/debug_log_util.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

typedef VoidCallback = void Function();

///通用工具类
class CommonUtil {
  static CommonUtil _instance;

  static CommonUtil _getInstance() {
    return _instance ??= CommonUtil._internal();
  }

  static CommonUtil get instance => _getInstance();

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

  ///设置屏幕方向
  screenOrientation(ScreenOrientation orientation) =>
      SystemChrome.setPreferredOrientations(
          ScreenOrientation.Portrait == orientation
              ? [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
              : [
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight
                ]);

  ///获取图片路径
  imageSrc(String imgName, {format = 'jpeg'}) =>
      'assets/images/$imgName.$format';

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ///打开默认浏览器[apk包放的网页地址]
  openDefaultWeb(String url) {
    if (url.isEmpty) {
      return;
    }
    if (!url.contains('http')) {
      url = 'https://$url';
    }
    _launchUrl(url);
  }

  ///拨打电话
  callPhone(String phoneNum) {
    if (phoneNum.isEmpty) {
      return;
    }
    final phone = 'tel:$phoneNum';
    _launchUrl(phone);
  }

  ///打开某个文件or 安装apk
  Future<OpenResult> openFile(String filePath) async {
    return await OpenFile.open(filePath).catchError(
        (e) => DebugLogUtil.printLog('openFile error : $e', tag: 'CommonUtil'));
  }
}

///屏幕方向 枚举
enum ScreenOrientation { Portrait, Landscape }
