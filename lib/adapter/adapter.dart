import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/component.dart';
import 'package:flutter_list_rdux/component/state.dart';
import 'package:flutter_list_rdux/page/state.dart';

class ItemAdapter extends DynamicFlowAdapter<HomeState> {
  ItemAdapter()
      : super(
          pool: <String, Component<Object>>{
            'item': ItemComponent(),
          },
          connector: _ItemConnector(),
        );
}

class _ItemConnector extends ConnOp<HomeState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeState state) {
    if (state.list.isNotEmpty) {
      return state.list
          .map((itemState) => ItemBean('item', itemState))
          .toList();
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(HomeState state, List<ItemBean> items) {
    if (items.isNotEmpty) {
      state.list = List<ItemState>.from(
          items.map((ItemBean bean) => bean.data).toList());
    } else {
      state.list = <ItemState>[];
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
