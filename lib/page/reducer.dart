import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.loadData: _onLoadData,
      HomeAction.addDone: _onAddDone,
    },
  );
}

HomeState _onAddDone(HomeState state, Action action) {
  final item = action.payload ?? ItemState();
  final newState = state.clone();
  newState.list.add(item);
  return newState;
}

HomeState _onLoadData(HomeState state, Action action) {
  final List<ItemState> stateList = action.payload ?? <ItemState>[];
  final HomeState newState = state.clone();
  newState.list = stateList;
  return newState;
}
