import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/state.dart';
import 'package:toast/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<WidgetState> buildEffect() {
  return combineEffects(<Object, Effect<WidgetState>>{
    Lifecycle.initState: _init,
    WidgetAction.refresh: _refresh,
    WidgetAction.loadMore: _loadMore,
  });
}

void _loadMore(Action action, Context<WidgetState> ctx) {
  var list = <ItemState>[];
  for (int i = 0; i <= 10; i++) {
    list.add(
        ItemState(title: "LoadMore Item$i", subTitle: "LoadMore subTitle:$i"));
  }
}

///加载默认数据
void _init(Action action, Context<WidgetState> ctx) {
  var list = <ItemState>[];
  for (int i = 0; i <= 10; i++) {
    list.add(ItemState(title: "item:$i", subTitle: "subTitle:$i"));
  }
  //通知reducer改变数据
  ctx.dispatch(WidgetActionCreator.onLoadDone(list));
}

///模拟网络请求
void _refresh(Action action, Context<WidgetState> ctx) async {
  var list = <ItemState>[];
  for (int i = 0; i <= 20; i++) {
    list.add(
        ItemState(title: "refresh item:$i", subTitle: "refresh subTitle:$i"));
  }
  //延迟5s模拟网络请求
  await Future.delayed(Duration(seconds: 2), () {
    //通知reducer改变数据
    Toast.show("数据刷新成功", ctx.context);
    ctx.dispatch(WidgetActionCreator.onLoadDone(list));
  });
}
