import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/adapter/adapter.dart';
import 'package:flutter_list_rdux/component/header/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
              adapter:NoneConn<HomeState>() +  ItemAdapter(),
              slots: <String, Dependent<HomeState>>{
                'header': HeaderConnector() + HeaderComponent(),
              }),
          middleware: <Middleware<HomeState>>[],
        );
}
