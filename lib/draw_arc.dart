import 'package:flutter/material.dart';
import 'dart:math' as math;

class DrawArc extends StatelessWidget {
  const DrawArc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: DrawArcView(),
        ),
      ),
    );
  }
}

class DrawArcView extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p1 = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill;

    Rect r1 = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: 300,
        height: 300);

    Paint p2 = Paint()
      ..color = Colors.pink.shade900
      ..style = PaintingStyle.fill;

    Rect r2 = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: 350,
        height: 350);

    Paint p3 = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    Rect r3 = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: 250,
        height: 250);

    Paint p4 = Paint()
      ..color = Colors.indigo.shade700
      ..style = PaintingStyle.fill;

    Rect r4 = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: 275,
        height: 275);    

    // NB : Parameter startAngle,sweepAngle expects Radians insted of degrees
    // startAngle = startAngle
    // sweepAngle = startAngle+sweepAngle

    // Degree to Radian Convertion Formula : (Degree)*(pi/180)
    const degreeToRadian = math.pi / 180;    

    canvas.drawArc(r1, (math.pi * 0), (math.pi / 2), true, p1);
    canvas.drawArc(r2, (math.pi / 2), (math.pi / 4), true, p2);
    canvas.drawArc(r3, degreeToRadian*135, degreeToRadian*90, true, p3);
    canvas.drawArc(r4, degreeToRadian*225, degreeToRadian*135, true, p4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
