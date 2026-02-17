import 'package:app/core/extensions/context_extension.dart';
import 'package:app/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerOptionsColumn extends StatelessWidget {
  const ContainerOptionsColumn({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    required this.iconPath,
    this.isLoading = false,
    this.isRow = true,
  });
  final String title;
  final String value;
  final String iconPath;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isRow;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.0.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 20.h,
                            alignment: Alignment.center,
                            child: Text(value,
                                style: textTheme.displayLarge?.copyWith(
                                    color: AppColors.textColor, height: 1)),
                          ),
                          SizedBox(width: 10.w),
                          SizedBox(
                            width: 20.h,
                            height: 20.h,
                            child: SvgPicture.asset(
                              iconPath,
                              colorFilter: const ColorFilter.mode(
                                AppColors.yellowDarkColor,
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.contain,
                              width: 20.h,
                              height: 20.h,
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: 5.h),
                SizedBox(
                  // height: 130.w,
                  child: Text(
                    title,
                    style: textTheme.displayMedium?.copyWith(height: 1),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
