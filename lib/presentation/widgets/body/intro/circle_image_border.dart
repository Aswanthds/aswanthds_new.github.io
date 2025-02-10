import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../data/models/responsive_size.dart';

class CircleImageBorder extends StatelessWidget {
  const CircleImageBorder({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(
      deviceWidth: context.mediaQueryWidth,
      mobileSize: context.mediaQueryWidth * .62,
      ipadSize: context.mediaQueryWidth * .4,
      smallScreenSize: context.mediaQueryWidth * .29,
    );
    return Container(
      width: responsiveSize.getSize(),
      height: responsiveSize.getSize(),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
