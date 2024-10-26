import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(AnimatedDragonWidget());
}

class AnimatedDragonPainter extends CustomPainter {
  final Animation<double> animation;

  AnimatedDragonPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final bodyPath = Path();
    final detailPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Vẽ mây động
    _drawAnimatedClouds(canvas, size, animation.value);

    // Vẽ gió
    _drawWind(canvas, size, animation.value);

    // Body
    final bodyOffset = math.sin(animation.value * 2 * math.pi) * size.height * 0.05;
    bodyPath.moveTo(size.width * 0.8, size.height * 0.2 + bodyOffset);
    bodyPath.quadraticBezierTo(size.width * 0.9, size.height * 0.1 + bodyOffset, size.width * 0.95, size.height * 0.2 + bodyOffset);
    bodyPath.quadraticBezierTo(size.width * 0.8, size.height * 0.4 + bodyOffset, size.width * 0.6, size.height * 0.5 + bodyOffset);
    bodyPath.quadraticBezierTo(size.width * 0.4, size.height * 0.6 + bodyOffset, size.width * 0.2, size.height * 0.7 + bodyOffset);
    bodyPath.quadraticBezierTo(size.width * 0.1, size.height * 0.8 + bodyOffset, size.width * 0.15, size.height * 0.9 + bodyOffset);

    canvas.drawPath(bodyPath, paint);

    // Scales
    for (double i = 0.2; i < 0.9; i += 0.05) {
      final scalePoint = bodyPath.computeMetrics().first.getTangentForOffset(bodyPath.computeMetrics().first.length * i)?.position;
      if (scalePoint != null) {
        canvas.drawArc(
          Rect.fromCircle(center: scalePoint, radius: size.width * 0.02),
          math.pi, math.pi, false, detailPaint);
      }
    }

    // Eye
    canvas.drawCircle(Offset(size.width * 0.92, size.height * 0.18 + bodyOffset), size.width * 0.015, detailPaint);

    // Whiskers
    paint.color = Colors.black;
    canvas.drawLine(Offset(size.width * 0.95, size.height * 0.18 + bodyOffset), Offset(size.width, size.height * 0.15 + bodyOffset), paint);
    canvas.drawLine(Offset(size.width * 0.95, size.height * 0.22 + bodyOffset), Offset(size.width, size.height * 0.25 + bodyOffset), paint);

    // Legs
//     paint.color = Colors.red;
//     final legOffset = math.cos(animation.value * 2 * math.pi) * size.height * 0.03;
//     canvas.drawLine(Offset(size.width * 0.6, size.height * 0.5 + bodyOffset), Offset(size.width * 0.55, size.height * 0.6 + bodyOffset + legOffset), paint);
//     canvas.drawLine(Offset(size.width * 0.4, size.height * 0.6 + bodyOffset), Offset(size.width * 0.35, size.height * 0.7 + bodyOffset - legOffset), paint);

    // Beard
    final beardPath = Path();
    beardPath.moveTo(size.width * 0.9, size.height * 0.25 + bodyOffset);
    for (int i = 0; i < 3; i++) {
      beardPath.relativeQuadraticBezierTo(size.width * 0.03, size.height * 0.03, size.width * 0.06, 0);
      beardPath.relativeQuadraticBezierTo(size.width * 0.03, -size.height * 0.03, size.width * 0.06, 0);
    }
    canvas.drawPath(beardPath, paint);
    
    

    // Improved Legs
    _drawImprovedLegs(canvas, size, bodyOffset, animation.value);
  }

  void _drawAnimatedClouds(Canvas canvas, Size size, double animationValue) {
    final cloudPaint = Paint()
      ..color = Colors.lightBlue[100]!
      ..style = PaintingStyle.fill;

    final cloudStroke = Paint()
      ..color = Colors.blue[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    void drawCloud(double x, double y, double scale) {
      final cloudPath = Path();
      final offset = math.sin((animationValue + x / size.width) * 2 * math.pi) * size.height * 0.02;
      cloudPath.moveTo(x, y + offset);
      cloudPath.quadraticBezierTo(x + 25 * scale, y - 25 * scale + offset, x + 50 * scale, y + offset);
      cloudPath.quadraticBezierTo(x + 75 * scale, y - 25 * scale + offset, x + 100 * scale, y + offset);
      cloudPath.quadraticBezierTo(x + 125 * scale, y + 25 * scale + offset, x + 75 * scale, y + 25 * scale + offset);
      cloudPath.quadraticBezierTo(x + 50 * scale, y + 50 * scale + offset, x + 25 * scale, y + 25 * scale + offset);
      cloudPath.quadraticBezierTo(x - 25 * scale, y + 25 * scale + offset, x, y + offset);

      canvas.drawPath(cloudPath, cloudPaint);
      canvas.drawPath(cloudPath, cloudStroke);
    }

    drawCloud(size.width * 0.1, size.height * 0.2, 0.5);
    drawCloud(size.width * 0.5, size.height * 0.1, 0.7);
    drawCloud(size.width * 0.8, size.height * 0.3, 0.6);
    drawCloud(size.width * 0.2, size.height * 0.7, 0.4);
    drawCloud(size.width * 0.7, size.height * 0.8, 0.5);
  }

  void _drawWind(Canvas canvas, Size size, double animationValue) {
    final windPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (int i = 0; i < 5; i++) {
      final startX = size.width * (i * 0.2 + animationValue) % size.width;
      final startY = size.height * (0.3 + i * 0.15);
      final controlX = startX + size.width * 0.1;
      final controlY = startY - size.height * 0.05;
      final endX = startX + size.width * 0.2;
      final endY = startY;

      final windPath = Path();
      windPath.moveTo(startX, startY);
      windPath.quadraticBezierTo(controlX, controlY, endX, endY);

      canvas.drawPath(windPath, windPaint);
    }
  }
  
  void _drawImprovedLegs(Canvas canvas, Size size, double bodyOffset, double animationValue) {
    final legPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    void drawLeg(double startX, double startY, double angle, bool isFrontLeg) {
      final legLength = size.height * 0.15;
      final footLength = size.width * 0.04;
      
      // Tính toán chuyển động của chân
      final swingAngle = math.sin(animationValue * 2 * math.pi) * math.pi / 6;
      final adjustedAngle = angle + (isFrontLeg ? swingAngle : -swingAngle);

      // Vẽ phần trên của chân
      final upperLegEndX = startX + math.cos(adjustedAngle) * legLength * 0.6;
      final upperLegEndY = startY + math.sin(adjustedAngle) * legLength * 0.6;
      canvas.drawLine(Offset(startX, startY), Offset(upperLegEndX, upperLegEndY), legPaint);

      // Vẽ phần dưới của chân
      final lowerLegEndX = upperLegEndX + math.cos(adjustedAngle + math.pi / 6) * legLength * 0.4;
      final lowerLegEndY = upperLegEndY + math.sin(adjustedAngle + math.pi / 6) * legLength * 0.4;
      canvas.drawLine(Offset(upperLegEndX, upperLegEndY), Offset(lowerLegEndX, lowerLegEndY), legPaint);

      // Vẽ móng vuốt
      final clawAngle1 = adjustedAngle + math.pi / 4;
      final clawAngle2 = adjustedAngle;
      final clawAngle3 = adjustedAngle - math.pi / 4;

      canvas.drawLine(
        Offset(lowerLegEndX, lowerLegEndY),
        Offset(lowerLegEndX + math.cos(clawAngle1) * footLength, lowerLegEndY + math.sin(clawAngle1) * footLength),
        legPaint
      );
      canvas.drawLine(
        Offset(lowerLegEndX, lowerLegEndY),
        Offset(lowerLegEndX + math.cos(clawAngle2) * footLength, lowerLegEndY + math.sin(clawAngle2) * footLength),
        legPaint
      );
      canvas.drawLine(
        Offset(lowerLegEndX, lowerLegEndY),
        Offset(lowerLegEndX + math.cos(clawAngle3) * footLength, lowerLegEndY + math.sin(clawAngle3) * footLength),
        legPaint
      );
    }

    // Vẽ 4 chân
    drawLeg(size.width * 0.7, size.height * 0.45 + bodyOffset, math.pi / 2.5, true);
    drawLeg(size.width * 0.6, size.height * 0.5 + bodyOffset, math.pi / 2.2, false);
    drawLeg(size.width * 0.4, size.height * 0.6 + bodyOffset, math.pi / 2, true);
    drawLeg(size.width * 0.3, size.height * 0.65 + bodyOffset, math.pi / 1.8, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class AnimatedDragonWidget extends StatefulWidget {
  @override
  _AnimatedDragonWidgetState createState() => _AnimatedDragonWidgetState();
}

class _AnimatedDragonWidgetState extends State<AnimatedDragonWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return CustomPaint(
          painter: AnimatedDragonPainter(_controller),
          child: Container(
            width: 300,
            height: 200,
          ),
        );
      },
    );
  }
}
