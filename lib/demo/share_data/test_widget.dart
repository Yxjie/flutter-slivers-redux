import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/demo/share_data/share_data_widget.dart';
import 'package:flutter_list_rdux/utils/debug_log_util.dart';

///展示共享数据
class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    DebugLogUtil.printLog('build ...',tag: 'TestWidget');
    return Text(ShareDataWidget.of(context).count.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DebugLogUtil.printLog('Dependencies changed',tag: 'TestWidget');
  }
}
