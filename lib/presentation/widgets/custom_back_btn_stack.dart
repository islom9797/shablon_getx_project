import 'package:dadonda/core/utils/app_assets.dart';
import 'package:dadonda/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class CustomBackButton extends StatelessWidget {
  final Function()? back;
  const CustomBackButton({super.key, this.back});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 0,
        onPressed: back,
        child: SvgPicture.asset(
          AppAssets.icons.left,
          color: AppColors.nearlyBlack,
          width: 30.w,
        ),
      ),
    );
  }
}
