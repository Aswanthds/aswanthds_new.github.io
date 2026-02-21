import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import 'project_item.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = context.mediaQueryWidth;
    final bool isMobileOrTablet =
        deviceWidth < DeviceType.smallScreenLaptop.getMinWidth();

    if (isMobileOrTablet) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: AppConstants.projects.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) =>
            ProjectItem(project: AppConstants.projects[index]),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(deviceWidth),
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        mainAxisExtent: _getMainAxisExtent(deviceWidth),
      ),
      itemBuilder: (context, index) {
        return ProjectItemWeb(project: AppConstants.projects[index]);
      },
      itemCount: AppConstants.projects.length,
    );
  }

  int _getCrossAxisCount(double deviceWidth) {
    if (deviceWidth < 1100) {
      return 2;
    } else {
      return 3;
    }
  }

  double _getMainAxisExtent(double deviceWidth) {
    // 400-500 is usually enough for a Row layout with a 160px image
    if (deviceWidth < 1200) {
      return 450;
    }
    return 400; // Larger screens have wider columns, so text is shorter
  }
}
