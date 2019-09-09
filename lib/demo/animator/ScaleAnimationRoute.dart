import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽度从零到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //动画状态监听
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () => controller.forward(),
                  child: Text('执行动画forward'),
                ),
                RaisedButton(
                  onPressed: () => controller.reverse(),
                  child: Text('执行动画reverse'),
                ),
              ],
            ),
            Image.asset(
              CommonUtil.instance.imageSrc('ic'),
              width: animation.value,
              height: animation.value * 2,
            )
          ],
        ),
      ),
    );
  }
}
