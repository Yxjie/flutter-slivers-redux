import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/state.dart';

//TODO replace with your own action
enum HomeAction { loadData, add, addDone }

class HomeActionCreator {
  static Action onAction(List<ItemState> list) {
    return Action(HomeAction.loadData, payload: list);
  }

  static Action onAdd() {
    return const Action(HomeAction.add);
  }

  static Action onAddDone(ItemState state) {
    return Action(HomeAction.addDone, payload: state);
  }
}
