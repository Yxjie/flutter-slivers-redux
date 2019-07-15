import 'package:flutter_list_rdux/utils/util_index.dart';
import 'package:package_info/package_info.dart';

///获取包信息 工具类
class PackageUtil {

  static init() async {
    DebugLogUtil.printLog("PackageUtil  init...",tag: 'yxjie');
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    version = packageInfo.buildNumber;
  }

  ///获取 应用名
  static String appName;

  ///获取 包名
  static String packageName;

  ///获取 版本号[version name]
  static String version;

  ///获取 版本号
  static String versionCode;

}
