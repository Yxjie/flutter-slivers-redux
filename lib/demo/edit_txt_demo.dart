import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/widgets/edit_text_widget.dart';

class EditTxtDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditTxtState();
}

class _EditTxtState extends State<EditTxtDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EditText测试Demo"),
      ),
      body: Column(
        children: <Widget>[
          Text("测试"),
          editTxt,
          EditTextWidget(
            hintTxt: '请输入密码',
          ),
          ElevatedButton(
            onPressed: () {
              print("RaisedButton ==== ${editTxt.txtString}");
            },
            child: Text("click"),
          )
        ],
      ),
    );
  }

  var editTxt = EditTextWidget(
    hintTxt: '请输入姓名',
    defaultTxt: 'Yxjie',
  );
}
