import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class StoreState implements Cloneable<StoreState> {
  List<ChoiceState> choices;

  StoreState({this.choices});

  @override
  StoreState clone() {
    return StoreState()..choices = choices;
  }
}

StoreState initState(Map<String, dynamic> args) {
  return StoreState();
}

class ChoiceState implements Cloneable<ChoiceState> {
  String title;
  IconData icon;

  ChoiceState({this.title, this.icon});

  @override
  ChoiceState clone() {
    return ChoiceState()
      ..title = title
      ..icon = icon;
  }
}
