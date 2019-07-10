import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(StoreState state, Dispatch dispatch, ViewService viewService) {
  return DefaultTabController(
      length: state.choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabbed AppBar"),
          bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.deepOrange,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.orange,
              tabs: state.choices.map((state) {
                return Tab(
                  text: state.title,
                  icon: Icon(state.icon),
                );
              }).toList()),
        ),
        body: TabBarView(
            children: state.choices
                .map((value) => _buildCard(value.title, value.icon))
                .toList()),
      ));
}

Widget _buildCard(String title, IconData icon) {
  return Card(
    color: Colors.white,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            size: 160,
            color: Colors.deepOrange,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.deepOrange),
          )
        ],
      ),
    ),
  );
}
