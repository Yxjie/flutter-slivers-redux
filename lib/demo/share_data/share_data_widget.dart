import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  final int count;

  ShareDataWidget({@required this.count, Widget child}) : super(child: child);

  ///方便子树中widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
//    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
//    return context.inheritFromWidgetOfExactType(ShareDataWidget);
    //ancestorInheritedElementForWidgetOfExactType此方法TestWidget的didChangeDependencies不会调用
    //todo 注：build方法会被重新绘制
    return context
        .ancestorInheritedElementForWidgetOfExactType(ShareDataWidget)
        .widget;
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    // ignore: unrelated_type_equality_checks
    return oldWidget.count != count;
  }
}
