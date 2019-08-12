import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';
import 'effect.dart';
import 'reducer.dart';
import 'adapter.dart';

class HomePage extends Page<HomePageState, Map<String, dynamic>> {
  HomePage()
    :super(
      view: buildView,
      effect: buildEffect(),
      initState: initState,
      reducer: buildReducer(),
      dependencies: Dependencies<HomePageState>(
        adapter: NoneConn<HomePageState>() + MovieGroupAdapter(),
        slots: <String, Dependent<HomePageState>>{}
      ),
    );
}