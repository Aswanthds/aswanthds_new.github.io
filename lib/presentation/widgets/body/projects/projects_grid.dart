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
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(context.mediaQueryWidth),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: _getMainAxisExtent(context.mediaQueryWidth),
      ),
      itemBuilder: (context, index) {
        if (context.mediaQueryWidth < DeviceType.mobile.getMaxWidth()) {
          return ProjectItem(
            project: AppConstants.projects[index],
          );
        } else if (context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()) {
          return ProjectItem(
            project: AppConstants.projects[index],
          );
        } else if (context.mediaQueryWidth <
            DeviceType.smallScreenLaptop.getMaxWidth()) {
          return SizedBox(
            height: 200,
            child: ProjectItemWeb(
              project: AppConstants.projects[index],
            ),
          );
        } else {
          return SizedBox(
            height: 200,
            child: ProjectItemWeb(
              project: AppConstants.projects[index],
            ),
          );
        }
      },
      itemCount: AppConstants.projects.length,
    );
  }

  int _getCrossAxisCount(double deviceWidth) {
    int numOfServices = AppConstants.projects.length;
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return 1;
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return 1;
    } else if (deviceWidth < DeviceType.smallScreenLaptop.getMaxWidth()) {
      return 3;
    } else {
      return numOfServices > 3 ? 3 : numOfServices;
    }
  }

  double? _getMainAxisExtent(double deviceWidth) {
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return null;
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return deviceWidth;
    } else if (deviceWidth < DeviceType.smallScreenLaptop.getMaxWidth()) {
      return 270;
    } else {
      return 320;
    }
  }
}
