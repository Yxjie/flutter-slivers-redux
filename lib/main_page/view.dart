import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/widgets/pop_scope_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
//    appBar: AppBar(
//      title: Text("Flutter常用框架"),
//    ),
//    body: IndexedStack(
//      index: state.currentIndex,
//      children: state.pageList,
//    ),

    body: PopScopeWidget(
      childWidget: IndexedStack(
        index: state.currentIndex,
        children: state.pageList,
      ),
    ),

    bottomNavigationBar: BottomNavigationBar(
      items: state.tabList
          .map((item) => BottomNavigationBarItem(
                icon: item['icon'],
                label: item['text'],
              ))
          .toList(),
      currentIndex: state.currentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Theme.of(viewService.context).primaryColor,
      onTap: (index) => dispatch(MainActionCreator.onCurrentIndex(index)),
    ),
  );
}
