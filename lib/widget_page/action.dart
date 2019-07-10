import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/state.dart';

enum WidgetAction { refresh, loadDone, loadMore, loadMoreDone }

class WidgetActionCreator {
  static Action onRefresh() => const Action(WidgetAction.refresh);

  static Action onLoadDone(List<ItemState> list) {
    return Action(WidgetAction.loadDone, payload: list);
  }

  static Action onLoadMore() {
    return const Action(WidgetAction.loadMore);
  }

  static Action onLoadMoreDone(List<ItemState> list){
    return Action(WidgetAction.loadMoreDone,payload: list);
  }
}
