import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/demo/share_data/share_data_widget.dart';
import 'package:flutter_list_rdux/demo/share_data/test_widget.dart';

class TestInheritedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestInheritedWidgetState();
}

class _TestInheritedWidgetState extends State<TestInheritedWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("[数据共享]InheritedWidget"),
      ),
      body: Center(
        child: ShareDataWidget(
          count: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TestWidget(),
              ),
              RaisedButton(
                child: Text("增加"),
                onPressed: () {
                  setState(() {
                    ++count;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
