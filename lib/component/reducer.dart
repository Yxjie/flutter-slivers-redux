import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemState>>{
//      ItemAction.jumpDetail: _onAction,
    },
  );
}

ItemState _onAction(ItemState state, Action action) {
  final ItemState newState = state.clone();
  return newState;
}
