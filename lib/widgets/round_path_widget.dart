import 'dart:math';

import 'package:flutter/material.dart';

class RoundPathWidget extends StatelessWidget {
  final Widget child;
  final double leftTopRadius;
  final double rightTopRadius;
  final double leftBottomRadius;
  final double rightBottomRadius;

  final PathShapeEnum pathShape;
  final double radius;

  RoundPathWidget(
      {@required this.child,
      this.radius = 0,
      this.pathShape = PathShapeEnum.CirclePath,
      this.leftTopRadius = 0,
      this.rightTopRadius = 0,
      this.leftBottomRadius = 0,
      this.rightBottomRadius = 0})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RoundPathClipper(
          leftTopRadius: leftTopRadius,
          rightTopRadius: rightTopRadius,
          leftBottomRadius: leftBottomRadius,
          rightBottomRadius: rightBottomRadius,
          pathShape: pathShape,
          radius: radius),
      child: child,
    );
  }
}

enum PathShapeEnum { CirclePath, RoundRect, PartRoundRect }

class RoundPathClipper extends CustomClipper<Path> {
  final double leftTopRadius;
  final double rightTopRadius;
  final double leftBottomRadius;
  final double rightBottomRadius;

  final PathShapeEnum pathShape;
  final double radius;

  RoundPathClipper(
      {this.pathShape,
      this.radius,
      this.leftTopRadius,
      this.rightTopRadius,
      this.leftBottomRadius,
      this.rightBottomRadius});

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final path = Path();

    if (PathShapeEnum.CirclePath == pathShape) {
      path.addOval(Rect.fromLTRB(0, 0, width, height));
    } else if (PathShapeEnum.RoundRect == pathShape) {
      path.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, width, height), Radius.circular(radius)));
    } else {
      final leftTopRect =
          Rect.fromLTRB(0, 0, leftTopRadius * 2, leftTopRadius * 2);
      final leftBottomRect = Rect.fromLTRB(
          0, height - leftBottomRadius * 2, leftBottomRadius * 2, height);
      final rightTopRect = Rect.fromLTRB(
          width - 2 * rightTopRadius, 0, width, rightTopRadius * 2);
      final rightBottomRect = Rect.fromLTRB(width - 2 * rightBottomRadius,
          height - rightBottomRadius * 2, width, height);
      //左上角 圆弧
      path.arcTo(leftTopRect, 180 / 180 * pi, 90 / 180 * pi, false);
      //右上角圆弧
      path.lineTo(width - rightTopRadius, 0);
      path.arcTo(rightTopRect, 270 / 180 * pi, 90 / 180 * pi, false);
      //右下角
      path.lineTo(width, height - rightBottomRadius);
      path.arcTo(rightBottomRect, 0, 90 / 180 * pi, false);
      //左下角
      path.lineTo(leftBottomRadius, height);
      path.arcTo(leftBottomRect, 90 / 180 * pi, 90 / 180 * pi, false);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
