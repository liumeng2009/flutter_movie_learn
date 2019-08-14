import 'package:fish_redux/fish_redux.dart';

import '../../models/home.dart';

class TopicsPageState implements Cloneable<TopicsPageState> {
  List<Topic> topics = [];

  @override
  TopicsPageState clone() {
    return TopicsPageState()..topics = topics;
  }
}

TopicsPageState initState(Map<String, dynamic> map) {
  return TopicsPageState();
}