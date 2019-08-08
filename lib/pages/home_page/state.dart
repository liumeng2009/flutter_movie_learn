import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_learn/models/home.dart';

class HomePageState implements Cloneable<HomePageState> {
  Home home = new Home();
  bool isLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  HomePageState clone() {
    return new HomePageState()
      ..home = home
      ..isLoading = isLoading;
  }

  bool get isDataReady {
    return home.topics.isNotEmpty && home.sections.isNotEmpty;
  }
}

HomePageState initState(Map<String, dynamic> map) {
  return HomePageState()..isLoading = true;
}