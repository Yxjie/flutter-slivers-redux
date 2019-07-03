import 'package:fish_redux/fish_redux.dart';

class HeaderState implements Cloneable<HeaderState> {
  int total;

  HeaderState({this.total});

  @override
  HeaderState clone() {
    return HeaderState()..total = total;
  }
}

HeaderState initState(Map<String, dynamic> args) {
  return HeaderState();
}
