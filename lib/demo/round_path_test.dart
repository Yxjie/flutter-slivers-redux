import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/app_route.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';
import 'package:flutter_list_rdux/widgets/font_marquee_widget.dart';
import 'package:flutter_list_rdux/widgets/round_path_widget.dart';
import 'package:toast/toast.dart';

class RoundPathTest extends StatelessWidget {

  static final String routerName='RoundPathTest';

  final List<String> strList = ['支持圆形', '支持圆角矩形', '支持不同角的矩形', '看起来不还不错！！！'];

  @override
  Widget build(BuildContext context) {
    Object argument=AppRoute.argument(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('支持各种圆角布局样式Widget'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[

              Text('argument = ${argument.toString()}'),

              RaisedButton(onPressed:(){
                String jumpUrl='flutter_app://RoundPathTest?index=2&userName=Yxjie';
                Toast.show('发送jumpUrl = $jumpUrl', context);
                NavigatorUtil.push(context,jumpUrl);
              },child: Text('scheme跳转自己，传值'),),

              Padding(
                padding: const EdgeInsets.all(10),
                child: FontMarqueeWidget(
                  strList,
                  seconds: 2,
                ),
              ),
              RoundPathWidget(
                child: Image.asset(
                  CommonUtil.instance.imageSrc('girl'),
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
              ),
              RoundPathWidget(
                pathShape: PathShapeEnum.RoundRect,
                radius: 10,
                child: Image.asset(
                  CommonUtil.instance.imageSrc('girl'),
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                ),
              ),
              RoundPathWidget(
                pathShape: PathShapeEnum.PartRoundRect,
                leftTopRadius: 20,
                rightBottomRadius: 20,
                child: Image.asset(
                  CommonUtil.instance.imageSrc('girl'),
                  fit: BoxFit.cover,
                  width: 110,
                  height: 110,
                ),
              ),
              RoundPathWidget(
                pathShape: PathShapeEnum.PartRoundRect,
                leftTopRadius: 20,
                leftBottomRadius: 20,
                child: Image.asset(
                  CommonUtil.instance.imageSrc('girl'),
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
              RoundPathWidget(
                pathShape: PathShapeEnum.PartRoundRect,
                leftTopRadius: 20,
                leftBottomRadius: 10,
                rightBottomRadius: 10,
                child: Image.asset(
                  CommonUtil.instance.imageSrc('girl'),
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              RoundPathWidget(
                pathShape: PathShapeEnum.PartRoundRect,
                rightTopRadius: 15,
                rightBottomRadius: 15,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  width: 300,
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          Center(
                            child: Text("测试多种布局"),
                          ),
                          Text('支持不同角，不同圆弧大小')
                        ],
                      )),
                      Image.asset(
                        CommonUtil.instance.imageSrc('girl'),
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
