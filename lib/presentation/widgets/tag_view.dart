import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dadonda/core/utils/app_assets.dart';
import 'package:dadonda/core/utils/app_colors.dart';
class TagView extends StatelessWidget {
  final String text;
  const TagView({super.key, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      margin: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: AppColors.nearlyWhite,
        borderRadius: BorderRadius.all(Radius.circular(16.0.r)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(1.1, 1.1),
              blurRadius: 8.0),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          letterSpacing: 0.27,
          color: AppColors.accentColor,
        ),
      ),
    );
  }
}
