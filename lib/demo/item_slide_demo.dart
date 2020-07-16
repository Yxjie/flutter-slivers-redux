import 'package:flutter/material.dart';

class ItemSlideWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ItemSlideState();
}

class _ItemSlideState extends State<ItemSlideWidget> {
  var list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("侧滑ListView"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: Center(child: Text(list[index].toString()),),
              height: 50,
            );
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}


