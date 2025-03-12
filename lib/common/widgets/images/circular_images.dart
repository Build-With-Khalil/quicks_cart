import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:quicks_cart/utils/constants/colors.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

import '../../../utils/constants/sizes.dart';

class QCCircularImages extends StatelessWidget {
  const QCCircularImages({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = QCSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            (QCHelperFunctions.isDarkMode(context)
                ? QCColors.black
                : QCColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child:
              isNetworkImage
                  ? CachedNetworkImage(
                    imageUrl: image,
                    width: width,
                    height: height,
                    fit: fit,
                    color: overlayColor,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const QCShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            ),

                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  )
                  : Image(
                    image: AssetImage(image),
                    width: width,
                    height: height,
                    fit: fit,
                    color: overlayColor,
                  ),
        ),
      ),
    );
  }
}
