import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_shimmer_effect.dart';

class AppImageAsset extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const AppImageAsset({super.key, @required this.image, this.fit, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return image!.contains('http')
        ? CachedNetworkImage(
            imageUrl: image!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            placeholder: (context, url) => AppShimmerEffectView(
              height: height ?? double.maxFinite,
              width: width ?? double.maxFinite,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
          )
        : image!.split('.').last != 'svg'
            ? Image.asset(
                image!,
                fit: fit,
                height: height,
                width: width,
                color: color,
              )
            : SvgPicture.asset(
                image!,
                height: height,
                width: width,
                color: color,
              );
  }
}
