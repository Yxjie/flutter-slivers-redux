import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/state.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
    HomeAction.add: _onAdd,
  });
}

void _onAdd(Action action, Context<HomeState> ctx) {
  var item = ItemState(title: "LN", subTitle: 'beauty');
  ctx.dispatch(HomeActionCreator.onAddDone(item));
}

void _init(Action action, Context<HomeState> ctx) {
  final list = <ItemState>[
    ItemState(title: 'Kotlin', subTitle: 'Google'),
    ItemState(title: 'Dart', subTitle: 'Google'),
    ItemState(title: 'Java', subTitle: 'Sun'),
    ItemState(title: 'TensorFlow',subTitle: 'Google'),
    ItemState(title: 'Python',subTitle: '人生苦短，早学python'),
    ItemState(title: 'Yxjie', subTitle: 'Cool'),
  ];
  ctx.dispatch(HomeActionCreator.onAction(list));
}
