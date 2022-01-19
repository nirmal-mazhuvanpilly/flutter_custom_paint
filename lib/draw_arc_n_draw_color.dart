import 'package:flutter/material.dart';

class DrawColorNCircle extends StatelessWidget {
  const DrawColorNCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: DrawColorNCircleView(),
          )),
    );
  }
}

class DrawColorNCircleView extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.red, BlendMode.src);

    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 100, paint);

    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(center, 80, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
