import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/demo/models/common_model.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';
import 'package:flutter_list_rdux/widgets/future_builder_widget.dart';

class FutureBuilderDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FutureBuilderState();
}

class _FutureBuilderState extends State<FutureBuilderDemo> with ErrorCallback{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder控件封装"),
      ),
      body: FutureBuilderWidget<CommonModel>(
        commonWidget: CommonWidget(),
        loadData: _loadData,
//        errorWidget: NetErrorWidget(
//          callback:this,
//          errorChild: Center(
//            child: Text("网络出错 点击返回"),
//          ),
//        ),
      ),
    );
  }

 Future<CommonModel> _loadData(BuildContext context) async {
    String baseUrl = 'http://www.devio.org/io/flutter_app/';
    final resp = await HttpUtil.getInstance(baseUrl: baseUrl).fetchGet('json/test_common_model.json');
    return CommonModel.fromJson(resp);
  }

  @override
  void retryCall() {
    Navigator.of(context).pop();
  }
}

class CommonWidget extends NetNormalWidget<CommonModel> {
  @override
  Widget buildContainer(CommonModel t) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(t.title),
          Text(t.icon),
        ],
      ),
    );
  }
}
