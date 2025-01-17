import 'package:bilytica/core/constants/app_colors.dart';
import 'package:bilytica/core/extensions/date_format_extension.dart';
import 'package:bilytica/presentation/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DinnerCardWidget extends StatelessWidget {
  final String name;
  final int age;
  final String date;
  final String location;
  final String profilePic;
  const DinnerCardWidget({
    super.key,
    required this.name,
    required this.age,
    required this.date,
    required this.location,
    required this.profilePic,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.5,
      color: AppColors.containerBg,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: AppColors.blueIconColor),
                    SizedBox(width: 8),
                    CustomText(text: "Dinner", fontWeight: FontWeight.w700,)
                  ],
                ),
                Icon(Icons.more_vert),
              ],
            ),
            Divider(height: 30.h,),
            Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: AppColors.primaryColor,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          profilePic,
                        ),
                        radius: 30,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.greenColor,
                      radius: 6,
                    ),
                  ],
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "$name - $age", fontWeight: FontWeight.w700, size: 18.sp,),
                    SizedBox(height: 4),
                    CustomText(text: location, color: Colors.grey,)
                  ],
                ),
                Spacer(),
                Icon(Icons.mark_unread_chat_alt_outlined, color: AppColors.blueIconColor),
                SizedBox(width: 16),
                Icon(Icons.phone, color: AppColors.blueIconColor),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: AppColors.blackColor, size: 22.h,),
                        SizedBox(width: 4),
                        CustomText(text: 'Date'),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    CustomText(text: date.toFormattedDateTime(), size: 14.sp, fontWeight: FontWeight.w700,),
                  ],
                ),
                Container(
                  height: 50.h,
                  width: 1,
                  color: Colors.black12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.blackColor, size: 22.h,),
                        SizedBox(width: 8.h),
                        CustomText(text: 'Location'),
                      ],
                    ),
                    SizedBox(height: 4),
                    CustomText(text: location, fontWeight: FontWeight.w700,)

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
