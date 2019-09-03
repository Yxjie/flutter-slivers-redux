import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GestureRecognizerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GestureRecognizerWidgetState();
}

class _GestureRecognizerWidgetState extends State<GestureRecognizerWidget> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureRecognizer使用"),
      ),
      body: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: "hello World!"),
          TextSpan(
              text: "点我变色",
              style: TextStyle(
                  fontSize: 39, color: _toggle ? Colors.blue : Colors.red),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }),
          TextSpan(text: "hello new World"),
        ])),
      ),
    );
  }
}
