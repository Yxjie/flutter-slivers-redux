import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    HeaderState state, Dispatch dispatch, ViewService viewService) {
  return FractionallySizedBox(
    widthFactor: 1,
    child: Container(
      padding: const EdgeInsets.all(10),
      color: Colors.blueGrey,
      child: Text(
        "列表总数：${state.total}",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}
