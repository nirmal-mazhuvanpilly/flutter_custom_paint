import 'package:flutter/material.dart';
import 'dart:math' as math;

class Model {
  Color color;
  double angle;
  Model(this.color, this.angle);
}

// ignore: must_be_immutable
class CustomPieChart extends StatelessWidget {
  List<Model> pieModel = [
    Model(Colors.pink, 50),
    Model(Colors.red, 30),
    Model(Colors.yellow, 15),
    Model(Colors.green, 5),
  ];

  CustomPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          foregroundPainter: CustomPieChartView(pieModel),
        ),
      ),
    );
  }
}

class CustomPieChartView extends CustomPainter {
  final List<Model> pieModel;
  CustomPieChartView(this.pieModel);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    Paint paint2 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    Paint paint3 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    Rect rect1 = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 1.4),
        width: 300,
        height: 300);

    Rect rect2 = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 1.4),
        width: 200,
        height: 200);

    // Degree to Radian Convertion Formula : (Degree)*(pi/180)
    const degreeToRadian = math.pi / 180;

    // NB : Parameter startAngle,sweepAngle expects Radians insted of degrees
    // startAngle = startAngle
    // sweepAngle = startAngle+sweepAngle

    canvas.drawArc(
        rect1, 225 * degreeToRadian, degreeToRadian * 135, true, paint1);
    canvas.drawArc(
        rect1, degreeToRadian * 180, degreeToRadian * 45, true, paint2);
    canvas.drawArc(
        rect1, degreeToRadian * 90, degreeToRadian * 90, true, paint1);
    canvas.drawArc(
        rect1, degreeToRadian * 45, degreeToRadian * 45, true, paint2);
    canvas.drawArc(
        rect1, degreeToRadian * 0, degreeToRadian * 45, true, paint1);
    canvas.drawArc(rect2, 0, math.pi * 2, true, paint3);

    //Generate Pie Chart from List
    ///
    const angleToPie = (math.pi * 2) / 100;

    double startAngle = 0;
    double sweepAngle = 0;

    for (var value in pieModel) {
      Paint paint = Paint()
        ..color = value.color
        ..style = PaintingStyle.fill
        ..strokeWidth = 5;

      Rect rect = Rect.fromCenter(
          center: Offset(size.width / 2, size.width / 2),
          width: 300,
          height: 300);

      sweepAngle = value.angle;

      canvas.drawArc(
          rect, angleToPie * startAngle, angleToPie * sweepAngle, true, paint);

      startAngle = startAngle + value.angle;
    }

    ///
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
