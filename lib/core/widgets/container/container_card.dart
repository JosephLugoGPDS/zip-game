import 'package:app/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({
    super.key,
    required this.children,
    this.color,
    this.elevation = 2.0,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.margin,
    this.padding,
    this.borderColor = Colors.transparent,
    this.borderRadius = 5,
    this.boxShadow,
    this.width,
    this.height,
  });

  final List<Widget> children;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double elevation;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final Color borderColor;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(boxShadow: boxShadow),
      child: Card(
        color: color ?? AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        elevation: elevation,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Column(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
