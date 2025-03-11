import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/extensions.dart';
class EmptyView extends StatelessWidget {
  final int animatedBegin;
  final String imageUrl;
  final String text;
  final String? subText;
  const EmptyView(
      {super.key,
      this.imageUrl = '',
      this.text = '',
      this.subText,
      this.animatedBegin = 250});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 0.7.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInUp(
                duration: Duration(milliseconds: animatedBegin),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child:
                      Image.asset(imageUrl, height: 200.h, fit: BoxFit.contain),
                ),
              ),
              FadeInUp(
                duration: Duration(milliseconds: (animatedBegin * 1.4).toInt()),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              16.ph,
              FadeInUp(
                duration: Duration(milliseconds: (animatedBegin * 1.8).toInt()),
                child: Text(
                  subText ?? '',
                  textAlign: TextAlign.center,
                  style: context.txtTheme().titleMedium,
                ),
              ),
              SafeArea(top: false, child: 16.ph)
            ],
          ),
        ),
      ],
    );
  }
}
