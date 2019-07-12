import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/cookie_util.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

///
class WebViewPage extends StatefulWidget {
  String webUrl;
  bool showAppBar;

  WebViewPage({this.webUrl, this.showAppBar = true, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  // On urlChanged stream
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  StreamSubscription<WebViewHttpError> _onHttpError;

  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;

  @override
  void initState() {
    super.initState();
    if (widget.webUrl == null) {
      widget.webUrl = "http://www.baidu.com";
    }
    //flutterWebViewPlugin 监听想要监听内容
    _onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      print('onStateChanged: ${state.type} ${state.url}');
    });

    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
      print("onHttpError: ${error.code} ${error.url}");
    });

    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      print("onUrlChanged: $url");
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onStateChanged?.cancel();
    _onHttpError?.cancel();
    _onUrlChanged?.cancel();
    flutterWebViewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget.webUrl,
        appBar: AppBar(
          title: Text("WebView"),
        ),
        withZoom: true,
        withLocalStorage: true,
//        //默认就是有加载圆环提示
//        initialChild: Container(
//          child: Center(
//            child: CircularProgressIndicator(),
//          ),
//        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => flutterWebViewPlugin.goBack()),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () => flutterWebViewPlugin.goForward()),
              IconButton(
                  icon: Icon(Icons.autorenew),
                  onPressed: () => flutterWebViewPlugin.reload()),
            ],
          ),
        ));
  }
}
