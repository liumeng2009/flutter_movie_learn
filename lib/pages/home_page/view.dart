import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
  HomePageState state, dynamic dispatch, ViewService viewService
) {
  final ListAdapter listAdapter = viewService.buildAdapter();

  return Scaffold(
    key: state.scaffoldKey,
    appBar: AppBar(
      centerTitle: true,
      title: Text('五行缺脑'),
      leading: IconButton(
        icon: Icon(Icons.all_inclusive),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.tv),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    ),
    body: ModalProgressHUD(
      dismissible: true,
      color: Colors.transparent,
      opacity: 1,
      child: RefreshIndicator(
        onRefresh: () {
          return Future<void>.value(
            dispatch(HomePageActionCreator.onFetchAction())
          );
        },
        child: ListView.builder(
          itemBuilder: listAdapter.itemBuilder,
          itemCount: listAdapter.itemCount,
        ),
      ),
      inAsyncCall: state.isLoading,
    ),
  );
}