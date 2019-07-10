import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    WidgetState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("常用框架使用测试"),
    ),
    body: RefreshIndicator(
        child: _buildScrollView(state, dispatch, viewService),
        onRefresh: () => dispatch(WidgetActionCreator.onRefresh())),
  );
}

Widget _buildScrollView(
    WidgetState state, Dispatch dispatch, ViewService viewService) {
  final adapter = viewService.buildAdapter();
  return CustomScrollView(
    slivers: <Widget>[
      SliverToBoxAdapter(
        child: Container(
          height: 260,
          //Swiper外部需要套用一个容器来定义大小
          child: Swiper(
              itemCount: state.imgUrls.length,
              itemBuilder: (context, index) => Image.network(
                    state.imgUrls[index],
                    fit: BoxFit.fill,
                  ),
              autoplay: true,
              pagination: SwiperPagination(alignment: Alignment.bottomCenter)),
        ),
      ),

//      SliverFixedExtentList(
//          delegate: SliverChildBuilderDelegate(adapter.itemBuilder,
//              childCount: aditapter.itemCount),
//          itemExtent: 48),

      SliverList(
          delegate: SliverChildBuilderDelegate(adapter.itemBuilder,
              childCount: adapter.itemCount)),
//      ListView.builder(itemBuilder: adapter.itemBuilder,itemCount: adapter.itemCount,)
    ],
  );
}
