import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dadonda/core/utils/app_assets.dart';
import 'package:dadonda/core/utils/app_colors.dart';

import '../../core/utils/dimens.dart';

class PopUpView extends StatelessWidget {
  final List<String> items;

  final String selectedItem;
  final Function(String)? onTap;

  const PopUpView(
      {Key? key, this.selectedItem = '', this.items = const [], this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: onTap,
      offset: const Offset(0.5, 45),
      child: Container(
        alignment: Alignment.center,
        height: 24.h,
        padding: EdgeInsets.only(left: 12.w),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 1.w),
            borderRadius: BorderRadius.circular(Dimens.borderRadius)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              selectedItem.toUpperCase(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor),
            ),
            SizedBox(width: 5.w),
            const Icon(Icons.arrow_drop_down, color: AppColors.primaryColor)
          ],
        ),
      ),
      itemBuilder: (context) {
        return items
            .map((e) => PopupMenuItem<String>(
                value: e,
                child: Text(e.toUpperCase(),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor))))
            .toList();
      },
    );
  }
}
