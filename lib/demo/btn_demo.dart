import 'package:flutter/material.dart';

class BtnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Btn 样式'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text('ElevatedButton'),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 40,
            ),
            child: SizedBox(
              width: 200,
              child: TextButton(
                onPressed: () {},
                child: Text('TextButton'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  disabledBackgroundColor: Colors.lightGreen,
                  shape: StadiumBorder(
                      side: BorderSide(
                    color: Colors.blueGrey,
                    style: BorderStyle.none,
                    width: 80,
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
