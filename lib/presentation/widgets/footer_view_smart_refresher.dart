import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FooterViewSmartRefresher extends StatelessWidget {
  const FooterViewSmartRefresher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        return Padding(
          padding: Platform.isIOS
              ? EdgeInsets.only(bottom: 35.h)
              : EdgeInsets.only(bottom: 10.h, top: 10.h),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
