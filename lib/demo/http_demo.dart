import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';
import 'package:dio/dio.dart';
class HttpTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {
  var result = '';
  CancelToken _cancelToken=CancelToken();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http工具类测试'),
      ),
      body: _buildContainer(),
    );
  }

  _buildContainer() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 1,
            child: RaisedButton(
              onPressed: _getData,
              child: Text('发起get请求'),
            ),
          ),

          FractionallySizedBox(
            widthFactor: 1,
            child: RaisedButton(
              onPressed: (){
                HttpUtil.getInstance().cancelRequests(_cancelToken);
              },
              child: Text('请求取消'),
            ),
          ),

          Text('返回数据：$result')
        ],
      ),
    );
  }

  _getData() {
    HttpUtil.getInstance().fetchGet(Api.userWeb,cancelToken:_cancelToken).then((resp) {
      setState(() {
        result = resp.toString();
      });
    });
  }
}
