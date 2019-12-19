import 'package:flutter/material.dart';

///带有圆角widget(仅限Image使用，自适应布局大小未考虑)
///枚举
enum ShapeWidget { Circle, RoundRect }

class RoundShapeWidget extends StatelessWidget {
  final Widget child;
  final ShapeWidget shapeWidget; //Widget展示类型
  final double radius; //圆角大小
  final double width;
  final double height;
  final VoidCallback clickCallback; //点击事件

  RoundShapeWidget({
    @required this.child,
    @required this.shapeWidget,
    this.clickCallback,
    this.radius = 16.0,
    this.width = 60.0,
    this.height = 60.0,
  })  : assert(child != null),
        assert(shapeWidget != null);

  @override
  Widget build(BuildContext context) {
    return ShapeWidget.Circle == shapeWidget
        ? GestureDetector(
            child: ClipOval(
              child: SizedBox(
                width: width,
                height: height,
                child: child,
              ),
            ),
            onTap: clickCallback,
          )
        : GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              child: SizedBox(
                width: width,
                height: height,
                child: child,
              ),
            ),
            onTap: clickCallback,
          );
  }
}
