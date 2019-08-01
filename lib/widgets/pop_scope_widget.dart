import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

/// 连续点击
class PopScopeWidget extends StatefulWidget {
  final Widget childWidget;
  final int second;

  PopScopeWidget({this.childWidget, this.second = 2, Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => PopScopeWidgetState();
}

class PopScopeWidgetState extends State<PopScopeWidget> {
  DateTime _lastPressDate;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: widget.childWidget,
        onWillPop: () async {
          if (null == _lastPressDate ||
              DateTime.now().difference(_lastPressDate) >
                  Duration(seconds: widget.second)) {
            _lastPressDate = DateTime.now();
            Toast.show('${widget.second}秒连续点击退出应用!', context);
            return false;
          }
          return true;
        });
  }
}
