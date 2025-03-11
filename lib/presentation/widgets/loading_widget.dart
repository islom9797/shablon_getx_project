import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/dimens.dart';
class LoadingView extends StatelessWidget {
  final bool isLoading;
  final Color? backgroundColor;

  const LoadingView({Key? key, this.isLoading = false, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.black12,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(0.9),
            ),
            padding: EdgeInsets.all(Dimens.appMargin),
            child: Lottie.asset(AppAssets.lotties.loadingGreen),
          ),
        ),
      ),
    );
  }
}
