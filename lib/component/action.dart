import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/state.dart';

//TODO replace with your own action
enum ItemAction { jumpDetail }

class ItemActionCreator {
  static Action onJumpDetail() {
    return const Action(ItemAction.jumpDetail);
  }
}
