import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DetailAction { loadData, loadDone, changeStyle }

class DetailActionCreator {
  static Action onLoadData() {
    return const Action(DetailAction.loadData);
  }

  static Action onLoadDone(List<String> list) =>
      Action(DetailAction.loadDone, payload: list);

  static Action onChangeStyle(bool isSelected) =>
      Action(DetailAction.changeStyle, payload: isSelected);
}
