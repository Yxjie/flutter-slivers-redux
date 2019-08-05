import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/demo/future_build_demo.dart';

import 'demo/btn_demo.dart';
import 'demo/canvas_demo.dart';
import 'demo/http_demo.dart';
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
      body: ListView(
        children: <Widget>[
          _buildListItem('MVP登录界面', LoginPage()),
          _buildListItem('Canvas使用', CustomPaintRoute()),
          _buildListItem('Btn 样式', BtnPage()),
          _buildListItem('Http测试 ', HttpTest()),
          _buildListItem('FutureBuilder控件封装 ', FutureBuilderDemo()),
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
