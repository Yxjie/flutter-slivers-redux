import 'package:fish_redux/fish_redux.dart';

class ItemState implements Cloneable<ItemState> {
  String title;
  String subTitle;

  ItemState({this.title, this.subTitle});

  @override
  ItemState clone() {
    return ItemState()
      ..title = title
      ..subTitle = subTitle;
  }
}

ItemState initState(Map<String, dynamic> args) {
  return ItemState();
}
