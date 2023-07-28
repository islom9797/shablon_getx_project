import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class DialogService {
  static showDialogSuccess(
      {String title = '',
      String content = '',
      String btnName = '',
      Function()? btnFunction}) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          ElevatedButton(onPressed: btnFunction, child: Text(btnName)),
        ],
      ),
    );
  }

  static confirmOrderDialog(Function()? confirm,
      {String body = 'content_dialog_order'}) {
    Get.defaultDialog(
      title: "confirmation".tr,
      titleStyle: Theme.of(Get.context!).textTheme.titleLarge,
      cancel: ElevatedButton(
        onPressed: Get.back,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.background),
        ),
        child: Text('cancel'.tr,
            style: const TextStyle(color: AppColors.darkerText)),
      ),
      confirm: ElevatedButton(onPressed: confirm, child: Text('confirm'.tr)),
      titlePadding: EdgeInsets.only(top: 16.h),
      contentPadding: EdgeInsets.all(16.w),
      content: Center(child: Text(body.tr)),
    );
  }
}
