import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/util_index.dart';
import 'package:toast/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

///基于flutter_webview对WebView封装
class WebViewPage extends StatefulWidget {
  final String webUrl;
  final bool showAppBar;
  final String webTitle;

  WebViewPage(
      {@required this.webUrl,
      this.showAppBar = true,
      this.webTitle = '',
      Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  String webUrl = "";

  //WebView控制器
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    webUrl = widget.webUrl;
    if (webUrl == null) {
      webUrl = "http://www.baidu.com";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.webTitle),
              actions: <Widget>[
                WebViewRefreshWidget(_controller.future),
                WebViewMenuItemWidget(_controller.future),
              ],
            )
          : null,
      body: Builder(
        builder: (context) => WebView(
          initialUrl: webUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          javascriptChannels: <JavascriptChannel>[
            //todo js调用Flutter端方法
            _toasterJavascriptChannel(context),
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

///webView menu 界面操作
class WebViewMenuItemWidget extends StatelessWidget {
  final Future<WebViewController> _webViewControllerFuture;

  WebViewMenuItemWidget(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        bool webViewReady = snapshot.connectionState == ConnectionState.done;
        WebViewController controller = snapshot.data;
        return PopupMenuButton(
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            PopupMenuItem(
              child: Text("前进"),
              value: "forward",
            ),
            PopupMenuItem(
              child: Text("后退"),
              value: "back",
            ),
          ],
          onSelected: (String value) {
            switch (value) {
              case 'forward':
                if (webViewReady) {
                  _forWard(context, controller);
                }
                break;

              case 'back':
                if (webViewReady) {
                  _goBack(context, controller);
                }
                break;
            }
          },
          onCanceled: () => {
            //没有任何操作
          },
        );
      },
    );
  }

  ///浏览器前进
  _forWard(BuildContext context, WebViewController controller) async {
    if (await controller.canGoForward()) {
      await controller.goForward();
    } else {
      Scaffold.of(context).showSnackBar(
        const SnackBar(content: Text("No forward history item")),
      );
    }
  }

  ///后退
  _goBack(BuildContext context, WebViewController controller) async {
    if (await controller.canGoBack()) {
      await controller.goBack();
    } else {
      Scaffold.of(context).showSnackBar(
        const SnackBar(content: Text("No back history item")),
      );
    }
  }
}

/// WebView 界面刷新空间
class WebViewRefreshWidget extends StatelessWidget {
  final Future<WebViewController> _webViewControllerFuture;

  WebViewRefreshWidget(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _webViewControllerFuture,
        builder:
            (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
          bool webViewReady = snapshot.connectionState == ConnectionState.done;
          WebViewController controller = snapshot.data;
          return IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: !webViewReady
                ? null
                : () {
                    Toast.show("Refresh ...", context);
                    controller.reload();
                  },
          );
        });
  }
}
