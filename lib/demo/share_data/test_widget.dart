import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/demo/share_data/share_data_widget.dart';

///展示共享数据
class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).count.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies changed");
  }
}
