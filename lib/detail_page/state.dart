import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/state.dart';

class DetailState implements Cloneable<DetailState> {
  ItemState itemState;
  bool showList = true;
  List<String> list;

  @override
  DetailState clone() {
    return DetailState()
      ..itemState = itemState
      ..showList = showList
      ..list = list;
  }
}

DetailState initState(Map<String, dynamic> args) {
  final newState = DetailState();
  newState.itemState = (args['item'] as ItemState) ?? ItemState();
  return newState;
}
