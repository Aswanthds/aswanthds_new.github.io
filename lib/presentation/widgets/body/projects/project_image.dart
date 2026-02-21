import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';

import '../../../../core/utils/app_colors.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({
    super.key,
    required this.imageUrl,
    required this.projectName,
  });
  final String imageUrl;
  final String projectName;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Semantics(
      label: 'Screenshot of $projectName project',
      image: true,
      child: Container(
        height: isMobile ? 180 : 250,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: const CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          errorWidget: (context, url, error) {
            return Container(
              color: AppColors.darkColor,
              child: Icon(Icons.error, color: AppColors.primaryColor, size: 40),
            );
          },
        ),
      ),
    );
  }
}

class ProjectImageWeb extends StatelessWidget {
  const ProjectImageWeb({
    super.key,
    required this.imageUrl,
    required this.projectName,
  });
  final String imageUrl;
  final String projectName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Semantics(
        label: 'Screenshot of $projectName project',
        image: true,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: 160, // Reduced from 250 to allow more room for text
          height: 160, // Fixed height for consistency
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          fit: BoxFit.cover,
          errorWidget: (context, url, error) {
            return Container(
              color: AppColors.darkColor,
              child: Icon(Icons.error, color: AppColors.primaryColor, size: 50),
            );
          },
        ),
      ),
    );
  }
}
