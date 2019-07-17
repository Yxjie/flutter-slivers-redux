import 'package:flutter/material.dart';

import 'mvp/login/login_page.dart';
import 'utils/util_index.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  final textStyle=TextStyle(
    fontFamily: 'Barriecito',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('MVP登录界面',style: textStyle,),
            onTap: () => NavigatorUtil.jumpPage(context, LoginPage()),
          ),
          Divider(height: 0.1,)
        ],
      ),
    );
  }
}
