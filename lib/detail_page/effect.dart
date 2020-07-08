import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DetailState> buildEffect() {
  return combineEffects(<Object, Effect<DetailState>>{
    Lifecycle.initState: _initData,
//    DetailAction.loadData: _onAction,
  });
}

void _initData(Action action, Context<DetailState> ctx) {
  var list = <String>[];
  for (var i = 0; i < 20; i++) {
    list.add(
        '${ctx.state.itemState.title}--${ctx.state.itemState.subTitle}:$i');
  }
  ctx.dispatch(DetailActionCreator.onLoadDone(list));
}
