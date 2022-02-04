import 'dart:math';

import 'package:flutter/material.dart';

class TicketUI extends StatelessWidget {
  const TicketUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomPaint(
            painter: TicketUIView(),
          ),
        ),
      ),
    );
  }
}

class TicketUIView extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint paint = Paint()
      ..shader = LinearGradient(colors: [
        Colors.pink.shade800,
        Colors.pink.shade600,
        Colors.pink,
        Colors.pink.shade600,
        Colors.pink.shade800
      ]).createShader(Rect.fromCircle(center: center, radius: 100))
      ..style = PaintingStyle.fill;

    Path path = Path();

    const degreeToRadian = pi / 180;

    path.lineTo(size.width * .0, size.height * .70);
    path.lineTo(size.width * 1, size.height * .70);
    path.lineTo(size.width * 1, size.height * .50);
    path.lineTo(size.width * 1, size.height * .30);
    path.lineTo(size.width * 0, size.height * .30);
    path.lineTo(size.width * 0, size.height * .50);
    path.moveTo(size.width * 1, size.height * .50);
    path.addArc(
        Rect.fromCenter(
            center: Offset(size.width * 1, size.height * .50),
            width: 50,
            height: 50),
        90 * degreeToRadian,
        180 * degreeToRadian);
    path.addArc(
        Rect.fromCenter(
            center: Offset(size.width * 0, size.height * .50),
            width: 50,
            height: 50),
        270 * degreeToRadian,
        180 * degreeToRadian);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
