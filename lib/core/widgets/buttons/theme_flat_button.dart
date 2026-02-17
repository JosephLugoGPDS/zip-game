import 'package:app/core/extensions/context_extension.dart';
import 'package:app/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeFlatButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final Widget? icon;
  final double? height;
  final double? width;
  final double? radius;
  final TextStyle? textStyle;

  const ThemeFlatButton({
    super.key,
    this.onPressed,
    required this.text,
    Color? textColor,
    Color? backgroundColor,
    Color? borderColor,
    this.icon,
    this.width,
    this.radius,
    this.height,
    this.textStyle,
  })  : textColor = textColor ?? AppColors.whiteColor,
        backgroundColor = backgroundColor ?? AppColors.primaryColor,
        borderColor =
            borderColor ?? (backgroundColor ?? AppColors.primaryColor);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      foregroundColor: textColor,
      maximumSize: Size(360.w, 42.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      textStyle: textStyle ??
          context.textTheme.titleMedium?.copyWith(color: textColor, height: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 24.r)),
        side: BorderSide(
          color: onPressed == null ? AppColors.grayBorderColor : borderColor,
        ),
      ),
      disabledBackgroundColor: AppColors.grayBorderColor,
      disabledForegroundColor: AppColors.textLightColor,
      backgroundColor: backgroundColor,
    );

    return SizedBox(
      height: height ?? 38.h,
      width: width,
      child: TextButton(
        style: flatButtonStyle,
        onPressed: onPressed,
        child: Center(
          child: icon != null ? icon! : Text(text),
        ),
      ),
    );
  }
}
