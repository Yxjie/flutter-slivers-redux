import 'package:flutter/material.dart';

///带有删除 功能输入框
class EditTextWidget extends StatefulWidget {
  final String hintTxt; //默认提示文案
  final String labelTxt;
  final String defaultTxt;
  final bool isObscure; //是否隐藏输入内容
  final bool focus; //是否获取焦点
  final bool enable; //是否被禁用
  final int maxLines; //最大行数
  final ChangedListener listener;
  TextEditingController _controller;

  EditTextWidget(
      {this.defaultTxt,
      this.hintTxt,
      this.labelTxt,
      this.maxLines,
      this.listener,
      this.enable = true,
      this.focus = true,
      this.isObscure = false,
      Key key})
      : super(key: key) {
    _controller = TextEditingController(text: defaultTxt);
  }

  ///获取输入框 内容
  String get txtString => _controller?.text ?? "";

  ///设置 输入框内容
  set text(String str) => _controller?.text = str;

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditTextWidget> {
  bool showDelete = false; //是否显示删除按钮
  //输入框对应监听
  TextEditingController controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    controller = widget._controller;
    _focusNode = FocusNode();
    controller.addListener(() {
      widget.listener?.onValueChange(controller.text.trim());
      setState(() {
        //删除按钮是否展示
        showDelete = controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        TextField(
          maxLength: widget.maxLines,
          autofocus: widget.focus,
          obscureText: widget.isObscure,
          controller: controller,
          focusNode: _focusNode,
          enabled: widget.enable,
          decoration: InputDecoration(
            labelText: widget.labelTxt,
            hintText: widget.hintTxt,
          ),
        ),
        !showDelete
            ? Container()
            : Positioned(
                child: GestureDetector(
                  child: Icon(Icons.delete_outline),
                  onTap: () => controller.clear(),
                ),
                right: 10,
              )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode?.unfocus();
  }
}

///监听 输入框 内容改变
abstract class ChangedListener {
  void onValueChange(String str);
}
