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
          RaisedButton(
            onPressed: () {},
            child: Text('RaisedButton'),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 40,
            ),
            child: SizedBox(
              width: 200,
              child: FlatButton(
                onPressed: () {},
                child: Text('FlatButton'),
                color: Colors.green,
                disabledColor: Colors.lightGreen,
                textColor: Colors.white,
                disabledTextColor: Colors.blueGrey,
                splashColor: Colors.red,
                highlightColor: Colors.blue,
                shape: StadiumBorder(
                    side: BorderSide(
                  color: Colors.blueGrey,
                  style: BorderStyle.none,
                  width: 80,
                )),
              ),
            ),
          ),
          
          SwitchListTile(value: null, onChanged: null)
        ],
      ),
    );
  }
}
