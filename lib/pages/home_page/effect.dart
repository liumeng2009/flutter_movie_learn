import 'package:fish_redux/fish_redux.dart';

import '../../util/dogeTV.dart';

import 'state.dart';
import 'action.dart';

Effect<HomePageState> buildEffect() {
  return combineEffects(<Object, Effect<HomePageState>>{
    Lifecycle.initState: _init,
    HomePageAction.onFetch: _onFetch,
  });
}

void _init(Action action, Context<HomePageState> ctx) async {
  APIs.getHome().then((home) {
    ctx.dispatch(HomePageActionCreator.didLoadAction(home));
  });
}

void _onFetch(Action action, Context<HomePageState> ctx) async {
  APIs.getHome().then((home) {
    ctx.dispatch(HomePageActionCreator.didLoadAction(home));
  });
}