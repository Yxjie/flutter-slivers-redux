import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/store_page/state.dart';

//TODO replace with your own action
enum StoreAction { initDone, jumpWeb }

class StoreActionCreator {
  static Action onInitDone(List<ChoiceState> list) {
    return Action(StoreAction.initDone, payload: list);
  }

  static Action onJumpWeb() => const Action(StoreAction.jumpWeb);
}
