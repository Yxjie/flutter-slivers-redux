import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/component.dart';
import 'package:flutter_list_rdux/component/state.dart';
import 'package:flutter_list_rdux/widget_page/state.dart';

class WidgetAdapter extends DynamicFlowAdapter<WidgetState> {
  WidgetAdapter()
      : super(
          pool: <String, Component<Object>>{
            'item': ItemComponent(),
          },
          connector: _WidgetConnector(),
        );
}

class _WidgetConnector extends ConnOp<WidgetState, List<ItemBean>> {
  @override
  List<ItemBean> get(WidgetState state) {
    if (state.widgetList.isNotEmpty) {
      return state.widgetList.map((itemState) {
        return ItemBean("item", itemState);
      }).toList();
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(WidgetState state, List<ItemBean> items) {

    if(items.isNotEmpty){
//      state.widgetList=items.map((itemBean)=> itemBean.data).toList();

    state.widgetList=List<ItemState>.from(items.map((itemBean)=> itemBean.data).toList());
    }else{
      state.widgetList=<ItemState>[];
    }
  }

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
