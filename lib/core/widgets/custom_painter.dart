import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.03750000;
    paint0Stroke.color = const Color(0xffBA9778).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01875000, size.height * 0.01875000,
                size.width * 0.9625000, size.height * 0.9625000),
            bottomRight: Radius.circular(size.width * 0.2312500),
            bottomLeft: Radius.circular(size.width * 0.2312500),
            topLeft: Radius.circular(size.width * 0.2312500),
            topRight: Radius.circular(size.width * 0.2312500)),
        paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01875000, size.height * 0.01875000,
                size.width * 0.9625000, size.height * 0.9625000),
            bottomRight: Radius.circular(size.width * 0.2312500),
            bottomLeft: Radius.circular(size.width * 0.2312500),
            topLeft: Radius.circular(size.width * 0.2312500),
            topRight: Radius.circular(size.width * 0.2312500)),
        paint0Fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.03750000;
    paint1Stroke.color = const Color(0xff12CDD9).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01875000, size.height * 0.01875000,
                size.width * 0.9625000, size.height * 0.9625000),
            bottomRight: Radius.circular(size.width * 0.2312500),
            bottomLeft: Radius.circular(size.width * 0.2312500),
            topLeft: Radius.circular(size.width * 0.2312500),
            topRight: Radius.circular(size.width * 0.2312500)),
        paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01875000, size.height * 0.01875000,
                size.width * 0.9625000, size.height * 0.9625000),
            bottomRight: Radius.circular(size.width * 0.2312500),
            bottomLeft: Radius.circular(size.width * 0.2312500),
            topLeft: Radius.circular(size.width * 0.2312500),
            topRight: Radius.circular(size.width * 0.2312500)),
        paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.2500000, size.height * 0.01875000);
    path_2.lineTo(size.width * 0.4812500, size.height * 0.01875000);
    path_2.lineTo(size.width * 0.4812500, size.height * 0.9812500);
    path_2.lineTo(size.width * 0.01875000, size.height * 0.9812500);
    path_2.lineTo(size.width * 0.01875000, size.height * 0.2500000);
    path_2.cubicTo(
        size.width * 0.01875000,
        size.height * 0.1222841,
        size.width * 0.1222841,
        size.height * 0.01875000,
        size.width * 0.2500000,
        size.height * 0.01875000);
    path_2.close();

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.03750000;
    paint2Stroke.color = const Color(0xff1F1D2B).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Stroke);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff1F1D2B).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.6625000, size.height * 0.6062500);
    path_3.lineTo(size.width * 1.018750, size.height * 0.6062500);
    path_3.lineTo(size.width * 1.018750, size.height * 0.9812500);
    path_3.lineTo(size.width * 0.4312500, size.height * 0.9812500);
    path_3.lineTo(size.width * 0.4312500, size.height * 0.8375000);
    path_3.cubicTo(
        size.width * 0.4312500,
        size.height * 0.7097837,
        size.width * 0.5347838,
        size.height * 0.6062500,
        size.width * 0.6625000,
        size.height * 0.6062500);
    path_3.close();

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.03750000;
    paint3Stroke.color = const Color(0xff1F1D2B).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff1F1D2B).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
