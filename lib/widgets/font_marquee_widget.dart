import 'dart:async';

import 'package:flutter/material.dart';

///文字上下滚动效果
class FontMarqueeWidget extends StatefulWidget {
  final List<String> strList;
  final int seconds;

  FontMarqueeWidget(this.strList, {this.seconds = 3});

  @override
  State<StatefulWidget> createState() => FontMarqueeState();
}

class FontMarqueeState extends State<FontMarqueeWidget> {
  GlobalKey _myKey = GlobalKey();
  ScrollController _controller;
  Timer _timer;
  int index = 0;

  @override
  void dispose() {
    _controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    //来监听 节点是否build完成
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {
      _timer = Timer.periodic(Duration(seconds: widget.seconds), (timer) {
        index += _myKey.currentContext.size.height.toInt();
        _controller.animateTo((index).toDouble(),
            duration: Duration(seconds: 2), curve: Curves.easeOutSine);
        //滚动到底部从头开始
        if ((index - _myKey.currentContext.size.height.toInt()).toDouble() >
            _controller.position.maxScrollExtent) {
          _controller.jumpTo(_controller.position.minScrollExtent);
          index = 0;
        }
      });
    });
    _controller = ScrollController(initialScrollOffset: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      child: ListView.builder(
          key: _myKey,
          //禁止手动滑动
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.strList.length ?? 0,
          //item固定高度
          itemExtent: 17,
          scrollDirection: Axis.vertical,
          controller: _controller,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.strList[index] ?? "",
                style: TextStyle(fontSize: 12, color: Color(0xff606266)),
              ),
            );
          }),
    );
  }
}
