import 'package:flutter/material.dart';
import 'dart:math';

class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canvas画棋盘'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(300, 300),
          painter: _MyPainter(),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    //画横线
    for (int i = 0; i <= 15; i++) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }
    //画竖线
    for (int i = 0; i <= 15; i++) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画个黑棋
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
        Offset((size.width - eWidth) / 2, (size.height - eHeight) / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);

    //画白字
    paint.color=Colors.white;
    canvas.drawCircle(
        Offset((size.width + eWidth) / 2, (size.height + eHeight) / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
