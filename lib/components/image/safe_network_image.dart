import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class SafeNetworkImage extends StatelessWidget {
  const SafeNetworkImage({
    Key? key,
    required this.imageUrl,
    this.placeholder,
    this.imageBuilder,
    this.errorWidget,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  final String imageUrl;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: placeholder,
      imageBuilder: imageBuilder,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
