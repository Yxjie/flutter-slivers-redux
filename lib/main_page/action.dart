import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainAction { action, loadDone ,currentIndex}

class MainActionCreator {
  static Action onAction() {
    return const Action(MainAction.action);
  }

  static Action onLoadDone(Map<String, dynamic> map) {
    return Action(MainAction.loadDone, payload: map);
  }

  static Action onCurrentIndex(int index)=> Action(MainAction.currentIndex,payload: index);
}
