import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<DetailState>>{
      DetailAction.loadDone: _onLoadDone,
      DetailAction.changeStyle: _onChange,
    },
  );
}

DetailState _onChange(DetailState state, Action action) {
  final bool selected = action.payload ?? true;
  final DetailState newState = state.clone();
  newState.showList = selected;
  return newState;
}

DetailState _onLoadDone(DetailState state, Action action) {
  final List<String> list = action.payload ?? <String>[];
  final DetailState newState = state.clone();
  newState.list = list;
  return newState;
}
