import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/app_drawables.dart';
import '../../constants/app_styles.dart';
import '../loaders/shimmer_widget.dart';

class NetworkImageWidget extends StatelessWidget {
  final double height;
  final double width;
  final String? url;
  final bool borderRaadius;

  const NetworkImageWidget({
    Key? key,
    this.height = 32,
    this.url,
    this.width = 32,
    this.borderRaadius = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url?.isNotEmpty == true
        ? ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius:
                BorderRadius.all(Radius.circular(borderRaadius ? 8 : 0)),
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: height,
                width: width,
                imageUrl: url!,
                placeholder: (context, url) =>
                    ShimmerRectangle(height: height, width: width),
                errorWidget: (context, ur, error) {
                  debugPrint(
                      'error cached network image url: $url $error ');
                  return _networkImageErrorWidget(
                      height: height,
                      width: width,
                      borderRadius: borderRaadius);
                }),
          )
        : _networkImageErrorWidget(
            height: height, width: width, borderRadius: borderRaadius);
  }
}

Widget _networkImageErrorWidget(
        {required double width,
        required double height,
        bool borderRadius = true}) =>
    DecoratedBox(
      decoration: borderRadius
          ? AppStyles.decorationWhite10
          : AppStyles.decorationWithoutRadius,
      child: Image.asset(
        Drawables.placeholder,
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
