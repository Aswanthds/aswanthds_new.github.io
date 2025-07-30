import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';

import '../../../../core/utils/app_colors.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: context.mediaQueryWidth,
      height: context.mediaQueryWidth - 200,
      fit: BoxFit.cover,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) {
        return Icon(
          Icons.error,
          color: AppColors.darkColor,
          size: 50,
        );
      },
    );
  }
}

class ProjectImageWeb extends StatelessWidget {
  const ProjectImageWeb({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: (context.mediaQueryWidth * 0.01) * 5,
      height: (context.mediaQueryWidth * 0.01) * 10,
      placeholder: (context, url) => CircularProgressIndicator(),
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return Icon(
          Icons.error,
          color: AppColors.darkColor,
          size: 50,
        );
      },
    );
  }
}
