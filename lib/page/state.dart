import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/state.dart';

class HomeState implements Cloneable<HomeState> {
  List<ItemState> list;

  @override
  HomeState clone() {
    return HomeState()..list = list;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
