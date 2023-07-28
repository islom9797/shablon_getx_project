import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class ToastService {
  static show(
    String title,
    String message, {
    Color? backgroundColor,
    Color? colorText,
    Color? borderColor,
    Widget? icon,
  }) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar(
      title,
      message,
      reverseAnimationCurve: Curves.linear,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 5),
      backgroundColor: backgroundColor ?? Colors.amberAccent,
      colorText: colorText ?? AppColors.darkText,
      borderColor: borderColor,
      borderWidth: 1,
      icon: icon,
    );
  }

  static success(String title, String message) {
    show(
      title,
      message,
      backgroundColor: AppColors.successBgColor,
      borderColor: AppColors.successBorderColor,
      icon: const Icon(Icons.check_circle, color: AppColors.successColor),
    );
  }

  static info(String title, String message) {
    show(title, message,
        backgroundColor: AppColors.infoBgColor,
        borderColor: AppColors.infoBorderColor,
        icon: const Icon(Icons.info, color: AppColors.infoColor));
  }

  static warn(String title, String message) {
    show(
      title,
      message,
      backgroundColor: AppColors.warningBgColor,
      borderColor: AppColors.warningBorderColor,
      icon: const Icon(Icons.warning, color: AppColors.warningColor),
    );
  }

  static error(String title, String message) {
    show(
      title,
      message,
      backgroundColor: AppColors.errorBgColor,
      borderColor: AppColors.errorBorderColor,
      icon: const Icon(Icons.error, color: AppColors.errorColor),
    );
  }
}
