import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/navigator_util.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';

import 'jpush/JpushManager.dart';
import 'main_page/page.dart';
import 'utils/common_util.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    _countDown();
    super.initState();
    //初始化PackageUtil
    PackageUtil.init();
    //JPush申请权限 ios 适用
//    JPushManager.instance.applyJPushAuthorityIOS();
//    JPushManager.instance.setupAlias("yxjie");
  }

  @override
  Widget build(BuildContext context) {
    //工具类 获取屏宽
    double screenWidth = CommonUtil.instance.screenWidth(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            CommonUtil.instance.imageSrc('ic'),
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.fill,
          ),
          Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "简单框架\n有点小桑不起",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              )),
        ],
      ),
    );
  }

  void _countDown() {
    Future.delayed(Duration(seconds: 3), () {
      NavigatorUtil.jumpReplacePage(context, MainPage().buildPage(null));

//      Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(
//              builder: (buildContext) => HomePage().buildPage(null)));
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
