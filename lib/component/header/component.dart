import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/page/state.dart';

import 'state.dart';
import 'view.dart';

class HeaderComponent extends Component<HeaderState> {
  HeaderComponent()
      : super(
          view: buildView,
          dependencies: Dependencies<HeaderState>(
              adapter: null, slots: <String, Dependent<HeaderState>>{}),
        );
}

class HeaderConnector extends Reselect1<HomeState, HeaderState, int> {
  @override
  HeaderState computed(int state) {
    return HeaderState()..total = state;
  }

  @override
  int getSub0(HomeState state) {
    return state.list.length;
  }

  @override
  void set(HomeState state, HeaderState subState) {}
}
