import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            child: child,
            width: animation.value,
            height: animation.value,
          );
        },
        child: child,
      ),
    );
  }

  GrowTransition({this.child, this.animation});
}
