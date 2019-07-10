import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class MainState implements Cloneable<MainState> {
  int currentIndex;

  List<Map<String, dynamic>> tabList;

  List<Widget> pageList;

  MainState({this.currentIndex, this.tabList, this.pageList});

  @override
  MainState clone() {
    return MainState()
      ..currentIndex = currentIndex
      ..tabList = tabList
      ..pageList = pageList;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState(currentIndex: 0);
}
