import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/core/widgets/fade_in_up.dart';
import '../../../../core/utils/app_enums.dart';
import 'intro_circle_image_box.dart';
import 'intro_text.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.mediaQueryHeight * .12),
      child: context.mediaQueryWidth < DeviceType.mobile.getMaxWidth()
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 400),
                  child: const IntroCircleImageBox(),
                ),
                const SizedBox(height: 32),
                const IntroText(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const IntroText(),
                FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 800),
                  child: const IntroCircleImageBox(),
                ),
              ],
            ),
    );
  }
}
