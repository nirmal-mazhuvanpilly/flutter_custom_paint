import 'package:flutter/material.dart';

class CustomShape extends StatelessWidget {
  const CustomShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(Colors.red),
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
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
