import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<WidgetState> buildReducer() {
  return asReducer(
    <Object, Reducer<WidgetState>>{
      WidgetAction.loadDone: _onLoadDone,
      WidgetAction.loadMoreDone:_onLoadMoreDone,
    },
  );
}

WidgetState _onLoadMoreDone(WidgetState state, Action action) {
  final WidgetState newState = state.clone();
  final list=action.payload??<ItemState>[];
  newState.widgetList.addAll(list);
  return newState;
}


WidgetState _onLoadDone(WidgetState state, Action action) {
  final WidgetState newState = state.clone();
  final list=action.payload??<ItemState>[];
  newState.widgetList=list;
  return newState;
}
