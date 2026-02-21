import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_constants.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/presentation/widgets/body/experience/experience_timeline_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Professional Experience", style: AppStyles.s32),
        const SizedBox(height: 32),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppConstants.experiences.length,
          itemBuilder: (context, index) {
            return ExperienceTimelineItem(
              experience: AppConstants.experiences[index],
              isLast: index == AppConstants.experiences.length - 1,
            );
          },
        ),
      ],
    );
  }
}
