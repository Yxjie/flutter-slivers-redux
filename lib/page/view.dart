import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  final adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text("Slivers大家族属性"),
    ),
    body: _buildScrollView(adapter, viewService),
//    Container(
//          child: Column(
//            children: <Widget>[
//              viewService.buildComponent('header'),
//              Expanded(
//                  flex: 1,
//                  child: ListView.builder(
//                    itemBuilder: adapter.itemBuilder,
//                    itemCount: adapter.itemCount,
//                  )),
//            ],
//          ),
//    ),

    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    floatingActionButton: FloatingActionButton(
      onPressed: () {
        dispatch(HomeActionCreator.onAdd());
      },
      child: Icon(Icons.add),
      tooltip: "Add数据",
    ),
  );
}

_buildScrollView(ListAdapter adapter, ViewService viewService) {
  return CustomScrollView(
    slivers: <Widget>[
      SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Header View",
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ),
            viewService.buildComponent('header'),
          ],
        ),
      ),

      SliverPersistentHeader(
          delegate: __SliverAppBarDelegate(
              child: Image.asset('images/ic.jpeg',fit: BoxFit.cover,),
              maxHeight: 180,
              minHeight: 60)),

      SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(adapter.itemBuilder,
              childCount: adapter.itemCount),
          itemExtent: 48),
      SliverToBoxAdapter(
        child: Container(
          height: 100,
          color: Colors.orange,
          child: Center(
            child: Text(
              'Footer View',
              style: TextStyle(fontSize: 26),
            ),
          ),
        ),
      ),
    ],
  );
}

class __SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  __SliverAppBarDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}
