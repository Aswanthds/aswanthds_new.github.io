import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../data/models/responsive_size.dart';

class IntroImage extends StatelessWidget {
  const IntroImage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(
      deviceWidth: context.mediaQueryWidth,
      mobileSize: context.mediaQueryWidth * .55,
      ipadSize: context.mediaQueryWidth * .36,
      smallScreenSize: context.mediaQueryWidth * .26,
    );

    return Positioned(
      // alignment: Alignment.topRight,
      top: 10,
      right: 8,
      child: Image.asset(
        AppAssets.devImg,
        width: responsiveSize.getSize(),
        height: responsiveSize.getSize(),
      ),
    );
  }
}
