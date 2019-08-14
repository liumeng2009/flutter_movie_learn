import 'package:fish_redux/fish_redux.dart';

import '../../models/home.dart';
import 'state.dart';
import 'action.dart';

Reducer<TopicsPageState> buildReducer() {
  return asReducer(<Object, Reducer<TopicsPageState>>{
    TopicsPageAction.didLoad: loadTopics,
  });
}

TopicsPageState loadTopics(TopicsPageState state, Action action) {
  TopicsPageState newState = state.clone();
  List<Topic> topics = action.payload;
  newState.topics = topics;
  return newState;
}
