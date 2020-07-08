import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/detail_page/page.dart';
import 'package:flutter_list_rdux/utils/navigator_util.dart';
import 'action.dart';
import 'package:flutter/material.dart' hide Action;
import 'state.dart';

Effect<ItemState> buildEffect() {
  return combineEffects(<Object, Effect<ItemState>>{
    ItemAction.jumpDetail: _onJumpDetail,
  });
}

void _onJumpDetail(Action action, Context<ItemState> ctx) {
//  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (buildContext)=>DetailPage().buildPage({'item':ctx.state})));
//  Navigator.push(ctx.context, MaterialPageRoute(builder: (buildContext) {
//    return DetailPage().buildPage({'item': ctx.state});
//  }));
  NavigatorUtil.jumpPage(
      ctx.context, DetailPage().buildPage({'item': ctx.state}));
}
