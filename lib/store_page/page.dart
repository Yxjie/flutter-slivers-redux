import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class StorePage extends Page<StoreState, Map<String, dynamic>> {
  StorePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<StoreState>(
              adapter: null, slots: <String, Dependent<StoreState>>{}),
          middleware: <Middleware<StoreState>>[],
        );
}
