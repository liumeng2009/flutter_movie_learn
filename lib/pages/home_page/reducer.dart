import 'package:fish_redux/fish_redux.dart';
import '../../models/home.dart';

import 'state.dart';
import 'action.dart';

Reducer<HomePageState> buildReducer() {
  return asReducer(<Object, Reducer<HomePageState>>{
    HomePageAction.didLoad: _loadMovies,
    HomePageAction.onLoad: _onLoad,
    Lifecycle.initState: _init,
  });
}

HomePageState _init(HomePageState state, Action action) {
  HomePageState newState = state.clone();
  newState.isLoading = true;
  return newState;
}

HomePageState _loadMovies(HomePageState state, Action action) {
  HomePageState newState = state.clone();
  Home home = action.payload;
  newState.home = home;
  newState.isLoading = false;
  return newState;
}

HomePageState _onLoad(HomePageState state, Action action) {
  HomePageState newState = state.clone();
  newState.isLoading = action.payload;
  return newState;
}