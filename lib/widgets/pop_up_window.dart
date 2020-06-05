import 'dart:async';

import 'package:flutter/material.dart';

typedef DismissCallback = void Function();

/// 仿安卓PopupWindow
class PopupWindow extends StatefulWidget {
  ///定义静态弹出方法
  static void showPopWindow(context, String msg, GlobalKey popKey,
      [DismissCallback callback,
      PopDirection popDirection = PopDirection.bottom,
      Widget popWidget,
      double offset = 0]) {
    Navigator.push(
        context,
        PopRoute(
            child: PopupWindow(
          msg: msg,
          popKey: popKey,
          popDirection: popDirection,
          popWidget: popWidget,
          offset: offset,
          callback: callback,
        )));

    //如果弹窗是text提示 则3秒后消失
    if (popWidget == null) {
      Future.delayed(Duration(seconds: 3),
          () => Navigator.canPop(context) ? Navigator.pop(context) : null);
    }
  }

  final Color layerColor; //浮层背景色，默认：透明
  final String msg; //文本提示
  final GlobalKey popKey;
  final PopDirection popDirection; //弹出位置
  final Widget popWidget; //自定义widget
  final double offset; //popupWindow偏移量
  final DismissCallback callback;

  PopupWindow(
      {this.popWidget,
      this.msg,
      this.popKey,
      this.popDirection = PopDirection.bottom,
      this.layerColor = Colors.transparent,
      this.offset,
      this.callback});

  @override
  State<StatefulWidget> createState() {
    return _PopupWindowState();
  }
}

class _PopupWindowState extends State<PopupWindow> {
  GlobalKey childKey;
  double left = -100;
  double top = -100;

  @override
  void initState() {
    super.initState();
    childKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox renderBox = widget.popKey.currentContext.findRenderObject();
      Offset localToGlobal =
          renderBox.localToGlobal(Offset.zero); //targetWidget的坐标位置
      Size size = renderBox.size; //targetWidget的size

      RenderBox childBox = childKey.currentContext.findRenderObject();
      var childSize = childBox.size; //button的size
      switch (widget.popDirection) {
        case PopDirection.left:
          left = localToGlobal.dx - childSize.width - widget.offset;
          top = localToGlobal.dy + size.height / 2 - childSize.height / 2;
          break;
        case PopDirection.top:
          left = localToGlobal.dx + size.width / 2 - childSize.width / 2;
          top = localToGlobal.dy - childSize.height - widget.offset;
          fixPosition(childSize);
          break;
        case PopDirection.right:
          left = localToGlobal.dx + size.width + widget.offset;
          top = localToGlobal.dy + size.height / 2 - childSize.height / 2;
          break;
        case PopDirection.bottom:
          left = localToGlobal.dx + size.width / 2 - childSize.width / 2;
          top = localToGlobal.dy + size.height + widget.offset;
          fixPosition(childSize);
          break;
      }
      setState(() {});
    });
  }

  void fixPosition(Size buttonSize) {
    if (left < 0) {
      left = 0;
    }
    if (left + buttonSize.width >= MediaQuery.of(context).size.width) {
      left = MediaQuery.of(context).size.width - buttonSize.width;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: widget.layerColor,
            ),
            Positioned(
              child: GestureDetector(
                child: widget.popWidget == null
                    ? _buildWidget(widget.msg)
                    : _buildCustomWidget(widget.popWidget),
              ),
              left: left,
              top: top,
            )
          ],
        ),
        onTap: () {
          //点击控件消失
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  ///Text文本展示控件
  Widget _buildWidget(String text) {
    return Container(
      key: childKey,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Text(text),
    );
  }

  ///自定义widget展示
  Widget _buildCustomWidget(Widget child) => Container(
        key: childKey,
        child: child,
      );

  @override
  void dispose() {
    super.dispose();
    //popup dismiss 回调
    if (widget.callback != null) {
      widget.callback();
    }
  }
}

class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 200);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}

///枚举定义-展示方向
enum PopDirection { left, top, right, bottom }
