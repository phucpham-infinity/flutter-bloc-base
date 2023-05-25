import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/size.dart';

class OverlayWithRectangleClipping extends StatelessWidget {
  final double position;
  const OverlayWithRectangleClipping({super.key, required this.position});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: SizedBox(
              width: deviceWidth(context),
              height: deviceHeight(context),
              child: Stack(
                children: [
                  _getCustomPaintOverlay(context),
                  _getCustomPaintOverlayBorder(context)
                ],
              ))),
    );
  }

  CustomPaint _getCustomPaintOverlay(BuildContext context) {
    return CustomPaint(
        size: MediaQuery.of(context).size, painter: RectanglePainter(position));
  }

  CustomPaint _getCustomPaintOverlayBorder(BuildContext context) {
    return CustomPaint(
        size: MediaQuery.of(context).size, painter: RectangleBorder(position));
  }
}

class RectanglePainter extends CustomPainter {
  final double position;
  RectanglePainter(this.position);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;

    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addRRect(RRect.fromRectAndRadius(
                Rect.fromCenter(
                    center: Offset(size.width * 0.5, position),
                    width: size.width - Sz.i.s48,
                    height: (size.width - Sz.i.s48) * 0.6789),
                Radius.circular(Sz.i.s20)))
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RectangleBorder extends CustomPainter {
  final double position;
  RectangleBorder(this.position);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xff6FCF97)
      ..style = PaintingStyle.stroke
      ..strokeWidth = Sz.i.s4;

    canvas.drawPath(
        Path()
          ..addRRect(RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(size.width * 0.5, position),
                  width: size.width - Sz.i.s48,
                  height: (size.width - Sz.i.s48) * 0.6789),
              Radius.circular(Sz.i.s20))),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
