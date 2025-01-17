import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils{
  static Utils? _utils;
  static Utils? getIntance() {
    return (_utils == null) ? Utils() : _utils;
  }

  double horizontalPadding() => 22.w;
  SizedBox verticalTopSpace() => 18.verticalSpace;
}