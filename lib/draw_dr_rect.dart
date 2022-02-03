import 'package:flutter/material.dart';

class DrawDRRect extends StatelessWidget {
  const DrawDRRect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: DrawDRRectView(),
        ),
      ),
    );
  }
}

class DrawDRRectView extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint paint = Paint()
      ..color = Colors.red
      ..shader = LinearGradient(
              colors: [Colors.pink.shade900, Colors.pink.shade600, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: 100))
      ..style = PaintingStyle.fill;

    // RRect rrect1 = RRect.fromRectAndRadius(
    //     Rect.fromCenter(center: center, width: 300, height: 100),
    //     const Radius.circular(0));
    // RRect rrect2 = RRect.fromRectAndRadius(
    //     Rect.fromCenter(center: center, width: 100, height: 100),
    //     const Radius.circular(50));
    // canvas.drawDRRect(rrect1, rrect2, paint);
    
    RRect rrect1 = RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: size.width*.75, height: size.height*.25),
        const Radius.circular(0));
    RRect rrect2 = RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: 100, height: 100),
        const Radius.circular(500));
    canvas.drawDRRect(rrect1, rrect2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
