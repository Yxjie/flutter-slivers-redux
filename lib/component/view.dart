import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ItemState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: <Widget>[
      InkWell(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Text(
                state.title,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Text(
                state.subTitle,
                style: TextStyle(color: Colors.redAccent),
              )
            ],
          ),
        ),
        onTap: () => dispatch(ItemActionCreator.onJumpDetail()),
      ),
      Container(
        height: 1,
        color: Colors.black12,
      )
    ],
  );
}
