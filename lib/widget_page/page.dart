import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/widget_page/adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WidgetPage extends Page<WidgetState, Map<String, dynamic>> {
  WidgetPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<WidgetState>(
              adapter: WidgetAdapter(),
              slots: <String, Dependent<WidgetState>>{}),
          middleware: <Middleware<WidgetState>>[
            logMiddleware(tag: "WidgetPage", monitor: _monitor),
          ],
        );
}

///数据监听
String _monitor(WidgetState state) {
  if (state.widgetList == null) {
    return "母鸡a。。。";
  }
  state.widgetList.forEach(print);
  return state.widgetList.last.title;
}
