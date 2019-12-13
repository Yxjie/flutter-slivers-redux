import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/demo/animator/ScaleAnimationRoute.dart';
import 'package:flutter_list_rdux/demo/future_build_demo.dart';
import 'package:flutter_list_rdux/demo/sql_demo.dart';

import 'demo/btn_demo.dart';
import 'demo/canvas_demo.dart';
import 'demo/edit_txt_demo.dart';
import 'demo/gesture_recognizer_demo.dart';
import 'demo/http_demo.dart';
import 'demo/share_data/test_inherited_widget.dart';
import 'mvp/login/login_page.dart';
import 'utils/util_index.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final textStyle = TextStyle(
    fontFamily: 'Barriecito',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试工具代码"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem('MVP登录界面', LoginPage()),
          _buildListItem('Canvas使用', CustomPaintRoute()),
          _buildListItem('Btn 样式', BtnPage()),
          _buildListItem('Http测试 ', HttpTest()),
          _buildListItem('FutureBuilder控件封装 ', FutureBuilderDemo()),
          _buildListItem('EditText控件 ', EditTxtDemo()),
          _buildListItem('数据库使用 ', SQLDemo()),
          _buildListItem('[数据共享]InheritedWidget', TestInheritedWidget()),
          _buildListItem('GestureRecognizer使用', GestureRecognizerWidget()),
          _buildListItem('动画', ScaleAnimationRoute()),
        ],
      ),
    );
  }

  ///创建ListView item条目
  _buildListItem(String title, page) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            title,
            style: textStyle,
          ),
          onTap: () => NavigatorUtil.jumpPage(context, page),
        ),
        Divider(
          height: 0.1,
        )
      ],
    );
  }
}
