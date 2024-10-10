import 'dart:math' as math show pi;
import 'dart:ui';

import 'package:flutter/material.dart';

///
/// `useCanvas`:
/// true:  dùng canvas để vẽ
/// false: dùng path để vẽ
///
const bool useCanvas = false;

void main(List<String> args) {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPainter(),
    );
  }
}

class MyPainter extends StatelessWidget {
  const MyPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paint example'),
      ),
      body: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke // nếu xài path bắt buộc phải có style
      ..strokeCap = StrokeCap.round;

    final Path path = Path();

    // --------- LINE --------- \\
    void drawLine() {
      if (useCanvas) {
        // Cach 1:
        Offset startingPoint = Offset(0, size.height / 2);
        Offset endingPoint = Offset(size.width, size.height / 2);

        canvas.drawLine(startingPoint, endingPoint, paint);
      } else {
        // Cach 2: dung Path
        path.moveTo(0, size.height / 2);
        path.lineTo(size.width, size.height / 2);
        canvas.drawPath(path, paint);

        // --------- Path addRect Rect.fromLTWH--------- \\
        void addRect() {
          // Adds a rectangle

          final Path path = Path();
          path.addRect(
            Rect.fromLTWH(size.width / 2, size.height / 2 + 20, 100, 100),
          );
          canvas.drawPath(path, paint);
        }

        // addRect();

        // --------- Path addRRect Rect.fromRectAndRadius--------- \\
        void addRRect() {
          final Path path = Path();
          path.addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(
                  size.width / 4 - 30, size.height / 2 + 40, 100, 100),
              const Radius.circular(32)));
          canvas.drawPath(path, paint);
        }

        // addRRect();

        // --------- Path addRRect Rect.fromRectAndRadius--------- \\
        void addPath() {
          final Path path = Path();
          path.addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(size.width / 4, size.height * 3 / 4, size.width / 4,
                  size.height / 4),
              const Radius.circular(32)));

          final Path secondPath = Path();

          const double left = 20;
          final double top = size.height * 3 / 4 + 40;

          secondPath.moveTo(size.width / 4 - left, top);
          secondPath.lineTo(0 - left, top);

          path.addPath(secondPath, const Offset(16, 16));

          canvas.drawPath(path, paint);
        }

        // addPath();

        // --------- Path addRRect Rect.fromRectAndRadius--------- \\
        void relativePath() {
          final Path path = Path();
          path.moveTo(100, 100);
          path.relativeLineTo(200, 200);
          path.relativeLineTo(0, 200);
          canvas.drawPath(path, paint);

          final Path p = Path();
          p.moveTo(100, 110);
          p.lineTo(200, 200);
          p.lineTo(0, 200);
          p.lineTo(50, 300);
          p.lineTo(100, 300);
          canvas.drawPath(
              p,
              Paint()
                ..color = Colors.green
                ..strokeWidth = 4
                ..style = PaintingStyle.stroke);
        }

        // relativePath();

        void addPolygon() {
          path.addPolygon([
            Offset(size.width, size.height / 2),
            Offset(0, size.height / 2),
            Offset(size.width / 2, size.height / 4),
            Offset(size.width / 2, 50)
          ], true);
          canvas.drawPath(path, paint);
        }

        addPolygon();
      }
    }

    // --------- CIRCLE --------- \\
    void drawCircle() {
      if (useCanvas) {
        Offset center = Offset(size.width / 2, size.height / 2);

        canvas.drawCircle(center, 100, paint);
      } else {
        path.addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: 100,
        ));
        canvas.drawPath(path, paint);

        // --------- Path addOval Rect.fromLTWH--------- \\
        void addOval() {
          // Adds an oval
          path.addOval(Rect.fromLTWH(size.width / 2, size.height / 2,
              size.width / 4, size.height / 4));
          canvas.drawPath(path, paint);
        }

        addOval();
      }
    }

    // --------- QuadraticBezier --------- \\
    void drawQuadraticBezierTo() {
      path.moveTo(0, 0);
      // path.quadraticBezierTo(
      //     size.width / 2, size.height / 2, size.width - 100, size.height - 100);
      path.quadraticBezierTo(100, 100, 400, 400);
      canvas.drawPath(path, paint);
    }

    // --------- QuadraticBezier --------- \\
    void drawCubicTo() {
      // path.moveTo(0, 0);
      // path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
      //     size.height / 4, size.width, size.height);

      // canvas.drawPath(path, paint);

      path.moveTo(0, size.height / 2);
      path.cubicTo(
        size.height / 4,
        200,
        size.height / 4,
        -200,
        size.width,
        size.height / 2,
      );

      canvas.drawPath(path, paint);
    }

    // --------- QuadraticBezier --------- \\
    void arcTo() {
      path.moveTo(0, 0);
      double degToRad(num deg) => deg * (math.pi / 180.0);

      path.arcTo(
        Rect.fromLTWH(size.width / 2 + 50, 50, 100, 100),
        degToRad(0),
        degToRad(90),
        true,
      );
      path.arcTo(Rect.fromLTWH(size.width / 2 + 50, 50, 100, 100), math.pi,
          math.pi / 2, true);

      path.arcTo(Rect.fromLTWH(size.width / 2 + 40, 40, 120, 120), degToRad(0),
          degToRad(90), true);
      path.arcTo(Rect.fromLTWH(size.width / 2 + 40, 40, 120, 120), math.pi,
          math.pi / 2, true);

      canvas.drawPath(path, paint);

      void addArc() {
        path.addArc(
          Rect.fromLTWH(size.width / 2 + 80, 40, 80, 80),
          degToRad(270),
          degToRad(90),
        );
        canvas.drawPath(path, paint);
      }

      // addArc();
    }

    // drawLine();

    // drawCircle();

    // drawQuadraticBezierTo();

    // drawCubicTo();

    arcTo();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
