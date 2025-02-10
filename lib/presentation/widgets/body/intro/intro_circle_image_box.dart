import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';

import '../../../../data/models/responsive_size.dart';
import 'intro_image.dart';

class IntroCircleImageBox extends StatelessWidget {
  const IntroCircleImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(
      deviceWidth: context.mediaQueryWidth,
      mobileSize: context.mediaQueryWidth * .78,
      ipadSize: context.mediaQueryWidth * .50,
      smallScreenSize: context.mediaQueryWidth * .37,
    );
    return SizedBox(
      height: responsiveSize.getSize(),
      child: const IntroImage(),
    );
  }
}
