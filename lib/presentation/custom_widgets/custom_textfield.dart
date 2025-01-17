import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_colors.dart';

//ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? iconConstraints;
  final void Function(String)? onChanged;
  bool isEnabled = true;

  CustomTextField({
    super.key,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.iconConstraints,
    this.borderColor = AppColors.primaryColor,
    required this.hint,
    required this.controller,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        enabled: isEnabled,
        controller: controller,
        onChanged: onChanged,
        style: GoogleFonts.inter(
          fontSize: 14.sp,
        ),
        keyboardType: keyboardType,
        inputFormatters: (keyboardType == TextInputType.number)
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ]
            : null,
        decoration: InputDecoration(
          prefixIcon: (prefixIcon != null)
              ? Padding(
                  padding: EdgeInsets.all(8.w),
                  child: prefixIcon,
                )
              : null,
          suffixIcon: (suffixIcon != null)
              ? Padding(
                  padding: EdgeInsets.all(8.w),
                  child: suffixIcon,
                )
              : null,
          prefixIconConstraints:
              (iconConstraints == true) ? null : BoxConstraints(minWidth: 35.w),
          suffixIconConstraints:
              (iconConstraints == true) ? null : BoxConstraints(minWidth: 35.w),
          hintText: hint,
          counterText: "",
          isDense: true,
          hintStyle: TextStyle(
            color: AppColors.blackColor.withOpacity(.4),
            fontSize: 14.sp,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
          ),
          contentPadding:
              EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? AppColors.primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(16.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: .5,
              color: borderColor ?? AppColors.primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? AppColors.primaryColor, width: .5),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}
