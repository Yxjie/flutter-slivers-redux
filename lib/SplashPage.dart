import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/page/page.dart';
import 'package:flutter_list_rdux/utils/navigator_util.dart';

import 'main_page/page.dart';
import 'utils/common_util.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _countDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //工具类 获取屏宽
    double screenWidth = CommonUtil.INSTANCE.screenWidth(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            CommonUtil.INSTANCE.imageSrc('ic.jpeg'),
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
                  "Yxjie\n真帅气！么么哒！！",
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
}
