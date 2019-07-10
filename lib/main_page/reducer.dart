import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.loadDone: _onLoadDone,
      MainAction.currentIndex: _onCurrentIndex,
    },
  );
}

MainState _onLoadDone(MainState state, Action action) {
  final MainState newState = state.clone();
  final Map<String, dynamic> map = action.payload ?? {};
  if (map.containsKey("tabs")) {
    newState.tabList = map["tabs"] ?? [];
  }

  if (map.containsKey("pages")) {
    newState.pageList = map["pages"] ?? [];
  }
  return newState;
}

MainState _onCurrentIndex(MainState state, Action action) {
  final MainState newState = state.clone();
  final index = action.payload ?? 0;
  newState.currentIndex = index;
  return newState;
}
