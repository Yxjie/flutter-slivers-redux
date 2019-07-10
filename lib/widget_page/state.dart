import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_list_rdux/component/state.dart';

class WidgetState implements Cloneable<WidgetState> {
  List<ItemState> widgetList;
  List<String> imgUrls;

  WidgetState({this.widgetList});

  @override
  WidgetState clone() {
    return WidgetState()
      ..widgetList = widgetList
      ..imgUrls = imgUrls;
  }
}

WidgetState initState(Map<String, dynamic> args) {
  return WidgetState()
    ..imgUrls = [
      'http://b369.photo.store.qq.com/psb?/V11LtxAG1cXcm6/wrrFyRAvA4vvKMgcDrsNeBBOmGXsasgr4IepHK*r4x8!/m/dHEBAAAAAAAAnull&bo=gAKAAgAAAAAFByQ!&rf=photolist&t=5',
      'http://b369.photo.store.qq.com/psb?/V11LtxAG1cXcm6/QsKpVYhwRRTeaNx2LT1.ktXzfq3hoG.xBSjzEMJHHGk!/m/dHEBAAAAAAAAnull&bo=gAKAAgAAAAAFByQ!&rf=photolist&t=5',
      'http://b262.photo.store.qq.com/psb?/V11LtxAG0veb84/cm0rWrjdnRFEJ7qOcc8d6qW1OqufRBvHhV*Gcy6rABs!/m/dAYBAAAAAAAAnull&bo=VQOAAgAAAAAFB*A!&rf=photolist&t=5'
    ];
}
