import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNetworkImage extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String imageUrl;
  final String thumbnailImage;
  final BoxFit fit;

  const CustomNetworkImage(
      {Key? key,
      this.borderRadius = 16,
      this.imageUrl = '',
      this.thumbnailImage = '',
      this.fit = BoxFit.cover,
      this.height = 100,
      this.width = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height.h,
      width: width.w,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => const CupertinoActivityIndicator(),
      errorWidget: (context, url, error) =>
          const Icon(CupertinoIcons.exclamationmark_circle_fill),
    );
  }
}
