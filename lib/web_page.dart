import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/cookie_util.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String webUrl;
  bool showAppBar;

  WebViewPage({this.webUrl, this.showAppBar = true, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  String webTitle = "";

  @override
  void initState() {
    super.initState();
    if (widget.webUrl == null) {
      widget.webUrl = "http://www.baidu.com";
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(webTitle),
      ),
      body: Builder(
        builder: (context) => WebView(
          initialUrl: widget.webUrl,
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: <JavascriptChannel>[
            _toasterJavascriptChannel(context), //js调用Flutter端方法
          ].toSet(),

          navigationDelegate: (NavigationRequest request) {
            //对不符合条件跳转进行过滤
            if (!request.url.startsWith('http')) {
              DebugLogUtil.printLog("blocking navigation to $request",
                  tag: 'web_view');
              return NavigationDecision.prevent;
            }

            DebugLogUtil.printLog("allowing navigation to $request",
                tag: 'web_view');
            return NavigationDecision.navigate;
          },

          //界面开始加载
          onPageStarted: (String url) {
            DebugLogUtil.printLog("Page started loading: $url",
                tag: 'web_view');
          },
          //界面加载结束
          onPageFinished: (String url) {
            DebugLogUtil.printLog("Page finished loading: $url",
                tag: 'web_view');
          },
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
