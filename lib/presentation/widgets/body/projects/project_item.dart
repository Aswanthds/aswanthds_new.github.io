import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../data/models/project.dart';
import 'project_actions.dart';
import 'project_image.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.darkColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectImage(imageUrl: project.imageUrl),
          const SizedBox(height: 16),
          FittedBox(
            child: AutoSizeText(
              project.name,
              minFontSize: 10,
              maxFontSize: 14,
              style: AppStyles.s20.copyWith(color: AppColors.primaryColor),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: AutoSizeText(
              project.description,
              style: AppStyles.s18,
              minFontSize: 10,
              maxFontSize: 14,
              maxLines: 4,
            ),
          ),
          const SizedBox(height: 8),
          // if (project.previewLink != null || project.githubRepoLink != null)
          ProjectActions(project: project)
        ],
      ),
    );
  }
}

class ProjectItemWeb extends StatelessWidget {
  const ProjectItemWeb({super.key, required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: context.mediaQueryWidth * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.darkColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 12.0,
            children: [
              ProjectImageWeb(
                imageUrl: project.imageUrl,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      project.name,
                      minFontSize: 10,
                      maxFontSize: 14,
                      style:
                          AppStyles.s20.copyWith(color: AppColors.primaryColor),
                    ),
                    AutoSizeText(
                      project.description,
                      style: AppStyles.s14,
                      minFontSize: 12,
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
            ],
          ),
          ProjectActions(project: project)
          // if (project.previewLink != null || project.githubRepoLink != null)
        ],
      ),
    );
  }
}
