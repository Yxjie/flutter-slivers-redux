import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/jpush/JpushManager.dart';

/// JPush 推送测试
class JPushTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JPushTestState();
}

class _JPushTestState extends State<JPushTestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JPush 推送测试'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("打开系统设置"),
                onPressed: () => JPushManager.instance.openSystemSetting()),
            RaisedButton(
                child: Text('发送本地消息'),
                onPressed: () {
                  const extraMap = {'ff': '貌似是这么这么用的'};
                  JPushManager.instance.sendLocalNotification(extraMap);
                }),
            RaisedButton(
                child: Text('getLaunchAppNotification'),
                onPressed: () => JPushManager.instance.openAppByNotify())
          ],
        ),
      ),
    );
  }
}
