import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/body/about_me/basic_services_grid.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';


class BasicServicesSectionSection extends StatelessWidget {
  const BasicServicesSectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Text(
            AppStrings.skillsIHave,
            style: AppStyles.s32,
          ),
        ),
        const SizedBox(height: 32),
        const BasicServicesGrid(),
      ],
    );
  }
}
