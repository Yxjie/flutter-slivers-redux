import 'package:flutter/material.dart';
///画板
class DrawingBoardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoardPage> {
  List<List<Offset>> _path = [];

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent downEvent) {
        setState(() {
          _path.add([downEvent.localPosition]);
        });
      },
      onPointerMove: (PointerMoveEvent moveEvent) {
        setState(() {
          _path[_path.length - 1].add(moveEvent.localPosition);
        });
      },
      onPointerUp: (PointerUpEvent upEvent) {
        setState(() {
          _path[_path.length - 1].add(upEvent.localPosition);
        });
      },
      onPointerCancel: (PointerCancelEvent cancelEvent) {
        setState(() {
          _path[_path.length - 1].add(cancelEvent.localPosition);
        });
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: DrawingBoardPainter(_path),
        ),
      ),
    );
  }
}

class DrawingBoardPainter extends CustomPainter {
  final List<List<Offset>> path;
  Paint _paint;

  DrawingBoardPainter(this.path) {
    _paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
  }

  @override
  void paint(Canvas canvas, Size size) {
    path.forEach((list) {
      Path _path = Path();
      for (int i = 0; i < list.length; i++) {
        if (i == 0) {
          _path.moveTo(list[i].dx, list[i].dy);
        } else {
          _path.lineTo(list[i].dx, list[i].dy);
        }
      }
      canvas.drawPath( _path, _paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
