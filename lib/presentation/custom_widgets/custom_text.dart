import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    this.size,
    this.maxLines,
    this.fontWeight,
    this.color,
    this.textOverflow,
    this.textAlign,
    this.textStyle,
    super.key,
  });
  final String text;
  final double? size;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final Color? color;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      maxLines: (maxLines != null) ? maxLines : null,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle ??
          TextStyle(
            color: color ?? AppColors.blackColor,
            fontSize: size ?? 17.sp,
            fontFamily: 'SF Pro Display',
            fontWeight: fontWeight ?? FontWeight.w400,
            overflow: textOverflow,
          ),

    );
  }
}