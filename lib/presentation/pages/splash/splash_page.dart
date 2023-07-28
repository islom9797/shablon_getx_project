import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  static const String id = "/SplashPage";

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GetBuilder<SplashController>(
        init: SplashController(Get.find(), Get.find()),
        builder: (controller) {
          return Center(
            child: Image.asset(AppAssets.images.logo, height: 150.h),
          );
        },
      ),
    );
  }
}
