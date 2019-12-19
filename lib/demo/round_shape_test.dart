import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';
import 'package:flutter_list_rdux/widgets/round_shape_widget.dart';

class RoundShapeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("带有圆角控件测试"),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                RoundShapeWidget(
                    child: Image.asset(
                      CommonUtil.instance.imageSrc('ic'),
                      fit: BoxFit.cover,
                    ),
                    shapeWidget: ShapeWidget.Circle),
                RoundShapeWidget(
                    child: Image.asset(
                      CommonUtil.instance.imageSrc('girl'),
                      fit: BoxFit.cover,
                    ),
                    width: 120,
                    height: 120,
                    shapeWidget: ShapeWidget.Circle),
                RoundShapeWidget(
                    child: Image.asset(
                      CommonUtil.instance.imageSrc('girl'),
                      fit: BoxFit.cover,
                    ),
                    width: 130,
                    height: 130,
                    shapeWidget: ShapeWidget.RoundRect),
                RoundShapeWidget(
                    child: Image.asset(
                      CommonUtil.instance.imageSrc('ic'),
                      fit: BoxFit.cover,
                    ),
                    radius: 50,
                    width: 160,
                    height: 130,
                    shapeWidget: ShapeWidget.RoundRect),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
