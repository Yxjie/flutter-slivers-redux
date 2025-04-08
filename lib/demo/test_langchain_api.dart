import 'package:flutter/material.dart';
import 'package:flutter_list_rdux/utils/http_util.dart';

class QALangChain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QALangChainState();
}

class _QALangChainState extends State<QALangChain> {
  final TextEditingController _controller = TextEditingController();
  String _answer = "";
  bool _loading = false;

  Future<void> _askQuestion() async {
    setState(() => _loading = true);

    HttpUtil.getInstance(baseUrl: 'http://localhost:5600')
        .fetchPost('/ask', params: {"question": _controller.text}).then(
            (resp) => {
                  setState(() => {_loading = false, _answer = resp.toString()})
                });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('智能QA系统'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: '输入你的问题',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _askQuestion,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _loading ? CircularProgressIndicator() : Text(_answer)
          ],
        ),
      ),
    );
  }
}
