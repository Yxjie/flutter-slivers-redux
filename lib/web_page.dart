import 'package:flutter/material.dart';
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
        initialChild: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
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
