import 'package:dadonda/config/extensions.dart';
import 'package:dadonda/core/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dadonda/core/utils/app_assets.dart';
import 'package:dadonda/core/utils/app_colors.dart';
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double borderRadius;
  final String hintText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final int maxLines;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyBoardType;
  final Function(String value)? onChanged;
  final List<TextInputFormatter> inputFormatter;
  final bool? readOnly;

  final VoidCallback? onTap;

  const CustomTextField(
      {Key? key,
      this.maxLines = 1,
      this.textInputAction = TextInputAction.done,
      this.keyBoardType = TextInputType.text,
      this.prefix,
      this.prefixIcon,
      required this.controller,
      this.borderRadius = Dimens.formBorderRadius,
      this.hintText = '',
      this.onChanged,
      this.inputFormatter = const [],
      this.focusNode,
      this.readOnly,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadows: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(1, 1),
            blurRadius: borderRadius,
          ),
        ],
      ),
      child: Row(
        children: [
          if (prefix != null) prefix!,
          Expanded(
            child: TextField(
              onTap: onTap ?? () {},
              readOnly: readOnly ?? false,
              textInputAction: textInputAction,
              maxLines: maxLines,
              controller: controller,
              inputFormatters: inputFormatter,
              onChanged: onChanged,
              focusNode: focusNode,
              keyboardType: keyBoardType,
              cursorColor: AppColors.black,
              style: context.txtTheme().headlineSmall,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 18.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
