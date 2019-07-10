import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/page/page.dart';
import 'package:flutter_list_rdux/store_page/page.dart';
import 'package:flutter_list_rdux/widget_page/page.dart';
import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState: _init,
    MainAction.action: _onAction,
  });
}

///初始化数据
void _init(Action action, Context<MainState> ctx) {
  final tabList = [
    {'text': '业界动态', 'icon': Icon(Icons.language)},
    {'text': 'WIDGET', 'icon': Icon(Icons.extension)},
    {'text': '我的收藏', 'icon': Icon(Icons.favorite)},
    {'text': '关于手册', 'icon': Icon(Icons.import_contacts)},
  ];

  final pageList = [
    HomePage().buildPage(null),
    WidgetPage().buildPage(null),
//    _buildWidget("WIDGET"),
//    _buildWidget("我的收藏"),
    StorePage().buildPage(null),
    _buildWidget("关于手册")
  ];

  ctx.dispatch(
      MainActionCreator.onLoadDone({"tabs": tabList, "pages": pageList}));
}

Widget _buildWidget(String title) {
  return Center(
    child: Container(
      child: Text(title),
    ),
  );
}

void _onAction(Action action, Context<MainState> ctx) {}
