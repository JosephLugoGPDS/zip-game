import 'package:app/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiagonalPainter extends CustomPainter {
  final double heightClip;

  DiagonalPainter({required this.heightClip});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;
    final r = 15.r;

    final path = Path()
      ..moveTo(r, 0)
      ..lineTo(w - r, 0)
      ..arcToPoint(Offset(w, r), radius: Radius.circular(r))
      ..lineTo(w, h - r - heightClip)
      ..arcToPoint(Offset(w - r, h - heightClip), radius: Radius.circular(r))
      ..lineTo(r, h)
      ..arcToPoint(Offset(0, h - r), radius: Radius.circular(r))
      ..lineTo(0, r)
      ..arcToPoint(Offset(r, 0), radius: Radius.circular(r));
    // ..lineTo(r, h);
    // ..moveTo(w, 10.sp)
    // ..cubicTo(w, 5.sp, w - 5.sp, 0, w - 10.sp, 0)
    // ..lineTo(10.sp, 0)
    // ..cubicTo(5.sp, 0, 0, 5.sp, 0, 10.sp)
    // ..lineTo(0, h)
    // ..cubicTo(0, h + 2.5.sp, 4.sp, h + 5, 6.5.sp, h + 2.5.sp)
    // ..lineTo(12.7523, h - 2.5.sp)
    // ..cubicTo(14.5303, h - 5.sp, 16.5.sp, h - 5.sp, 19.sp, h - 5.sp)
    // ..lineTo(w - 10.sp, h - 5.sp)
    // ..cubicTo(w - 5.sp, h - 5.sp, w, h - 10.sp, w, h - 15.sp)
    // ..lineTo(w, 10);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
