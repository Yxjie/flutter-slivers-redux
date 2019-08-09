import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';

class HttpTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {
  var result = '';

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
          Text('返回数据：$result')
        ],
      ),
    );
  }

  _getData() {
    Api.baseUrl='https://www.jianshu.com/';
    HttpUtil.instance.fetchGet(Api.userWeb).then((resp) {
      setState(() {
        result = resp.toString();
      });
    });
  }
}
