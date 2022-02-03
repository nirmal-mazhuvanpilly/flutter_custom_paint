import 'dart:ui';

import 'package:flutter/material.dart';

class CustomShape extends StatelessWidget {
  const CustomShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: CurvePainter(Colors.red),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  Color brushColor;
  CurvePainter(this.brushColor);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = brushColor;
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.50, size.height * 0.9167);

    path.quadraticBezierTo(size.width * 0.70, size.height * 0.9567,
        size.width * 0.80, size.height * 0.9584);

    path.quadraticBezierTo(size.width * 0.90, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);

    Paint pointPainter1 = Paint()
      ..strokeWidth = 2
      ..color = Colors.purple;
    canvas.drawPoints(
        PointMode.lines,
        [
          const Offset(0.0, 0.0),
          Offset(size.width / 2, size.height / 2),
        ],
        pointPainter1);

    Paint pointPainter2 = Paint()
      ..strokeWidth = 2
      ..color = Colors.purple;
    canvas.drawPoints(
        PointMode.lines,
        [
          Offset(size.width / 2, size.height / 2),
          Offset(size.width, 0.0),
        ],
        pointPainter2);

    Paint ovalPaint = Paint();
    ovalPaint.color = Colors.green;
    ovalPaint.style = PaintingStyle.fill;
    ovalPaint.strokeWidth = 5.0;
    Rect rect = Rect.fromPoints(Offset(10.0, size.height * .30),
        Offset(size.width - 10.0, size.height * .60));
    canvas.drawOval(rect, ovalPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
