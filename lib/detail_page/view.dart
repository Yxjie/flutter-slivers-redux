import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'state.dart';

///SnackBar context 不是Scaffold不能弹问题加入
var _scaffoldKey = GlobalKey<ScaffoldState>();

Widget buildView(
    DetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    key: _scaffoldKey,
    body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                      child: Text("热度"),
                      value: "hot",
                    ),
                    PopupMenuItem<String>(
                      child: Text("最新"),
                      value: "new",
                    ),
                  ],
              onSelected: (String action) {
                switch (action) {
                  case "hot":
                    var snackBar = SnackBar(content: Text("hot"));
//                    Scaffold.of(viewService.context).showSnackBar(snackBar);//此种方式不行
                    _scaffoldKey.currentState.showSnackBar(snackBar);
                    print("hot");
                    break;
                  case "new":
                    print("new");
                    Toast.show("new", viewService.context);
                    break;
                }
              },
              onCanceled: () {
                print("onCanceled");
              },
            ),
          ],
          title: Text("Detail[Sliver控件类使用]"),
          backgroundColor: Theme.of(viewService.context).accentColor,
          expandedHeight: 220,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'images/ic.jpeg',
              fit: BoxFit.fitWidth,
            ),
          ),
//          floating: true,//下拉手势时就立即展开
//          snap: true,//同上 细节flexibleSpace是否立即展示
          pinned: true,
        ),
//        SliverFixedExtentList(
//            delegate: SliverChildListDelegate(
//              state.list.map((str) => _buildItem(str)).toList(),
//            ),
//            itemExtent: 50),

        SliverToBoxAdapter(
          child: SwitchListTile(
            value: state.showList,
            onChanged: (selected) {
              dispatch(DetailActionCreator.onChangeStyle(selected));
            },
            title: Text(state.showList ? "列表展示" : "网格展示"),
          ),
        ),

        state.showList
            ? SliverList(
                delegate: SliverChildListDelegate(
                  state.list.map((str) => _buildListItem(str)).toList(),
                ),
              )
            : SliverGrid.count(
                //SliverGrid三种实现方式
                crossAxisCount: 3,
                children: state.list.map((str) => _buildGridItem(str)).toList(),
              ),
      ],
    ),
  );
}

///Grid 展示样式
Widget _buildGridItem(title) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.deepOrange, width: 0.5),
    ),
    padding: const EdgeInsets.all(15),
    child: Column(
      children: <Widget>[
        Icon(
          Icons.android,
          color: Colors.deepOrange,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

///List 展示样式
Widget _buildListItem(title) {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.all(10),
    child: Row(
      children: <Widget>[
        Icon(
          Icons.android,
          color: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    ),
  );
}
