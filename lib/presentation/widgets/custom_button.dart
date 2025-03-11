
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/button_style.dart';
import 'measure_size.dart';
class CustomButton extends StatefulWidget {
  /// default state: [Active]
  final bool isActive;
  final void Function()? onPressed;
  final String text;

  final bool isLoading;
  final bool round;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isActive = true,
    this.isLoading = false,
    this.round = true,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double? height;
  double? width;

  void setSize(Size size) {
    setState(() {
      height = size.height;
      width = size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isActive ? widget.onPressed : null,
      style: ElevatedButtonStyle.small(
          rounded: widget.round,
          backgroundColor:
              widget.isLoading ? AppColors.button.withOpacity(0.8) : null),
      child: Builder(builder: (context) {
        if (widget.isLoading) {
          return SizedBox(
            height: height,
            width: width,
            child: Center(child: Lottie.asset(AppAssets.lotties.loading)),
          );
        }
        return MeasureSize(
            onChange: setSize,
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 16.sp),
            ));
      }),
    );
  }
}
