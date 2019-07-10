import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<StoreState> buildReducer() {
  return asReducer(
    <Object, Reducer<StoreState>>{
      StoreAction.initDone: _onInitDone,
    },
  );
}

StoreState _onInitDone(StoreState state, Action action) {
  final StoreState newState = state.clone();
  final list = action.payload ?? <ChoiceState>[];
  newState.choices = list;
  return newState;
}
