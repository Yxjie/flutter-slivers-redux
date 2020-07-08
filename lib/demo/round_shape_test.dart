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
                      width: 60,
                      height: 60,
                    ),
                    shapeWidget: ShapeWidget.Circle),
                RoundShapeWidget(
                    child: Image.asset(
                      CommonUtil.instance.imageSrc('girl'),
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                    shapeWidget: ShapeWidget.Circle),
                RoundShapeWidget(
                    child: Image.asset(
                      CommonUtil.instance.imageSrc('girl'),
                      fit: BoxFit.cover,
                      width: 130,
                      height: 130,
                    ),
                    shapeWidget: ShapeWidget.RoundRect),
                RoundShapeWidget(
                    child: Image.asset(
                      CommonUtil.instance.imageSrc('ic'),
                      fit: BoxFit.cover,
                      width: 160,
                      height: 130,
                    ),
                    radius: 50,
                    shapeWidget: ShapeWidget.RoundRect),
                RoundShapeWidget(
                  radius: 10.0,
                  shapeWidget: ShapeWidget.RoundRect,
                  child: Container(
                    color: Colors.blueGrey,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 4,
                      children: <Widget>[
                        Chip(
                          label: Text('Yxjie 真好看!'),
                          avatar: CircleAvatar(
                            backgroundColor: Colors.amberAccent,
                            child: Text('Y'),
                          ),
                        ),
                        Chip(
                          label: Text('Yxjie 真帅！！'),
                          avatar: CircleAvatar(
                            backgroundColor: Colors.amberAccent,
                            child: Text('X'),
                          ),
                        ),
                        Chip(
                          label: Text('Yxjie 帅得无法无天！！！'),
                          avatar: CircleAvatar(
                            backgroundColor: Colors.amberAccent,
                            child: Text('J'),
                          ),
                        ),
                        Chip(
                          label: Text('恶心死你们！'),
                          avatar: CircleAvatar(
                            backgroundColor: Colors.amberAccent,
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Chip(
                          label: Text('控件都懒得写！！！'),
                          avatar: CircleAvatar(
                            backgroundColor: Colors.amberAccent,
                            child: Icon(
                              Icons.adb,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
