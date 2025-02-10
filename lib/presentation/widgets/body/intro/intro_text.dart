import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import 'intro_actions.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          context.mediaQueryWidth < DeviceType.mobile.getMaxWidth()
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.helloIM,
          style: context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()
              ? AppStyles.s16
              : AppStyles.s32.copyWith(color: AppColors.white),
          textAlign: _getTextAlign(context.mediaQueryWidth),
          softWrap: true,
        ),
        const SizedBox(height: 6),
        Text(
          AppStrings.developerName,
          style: context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()
              ? AppStyles.s24
              : AppStyles.s52,
          textAlign: _getTextAlign(context.mediaQueryWidth),
          softWrap: true,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: context.mediaQueryWidth < DeviceType.mobile.getMaxWidth()
              ? context.mediaQueryWidth - 20
              : context.mediaQueryWidth / 2.5,
          child: Text(
            AppStrings.introMsg,
            style: context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()
                ? AppStyles.s14
                : AppStyles.s18,
            textAlign: _getTextAlign(context.mediaQueryWidth),
            softWrap: true,
          ),
        ),
        const SizedBox(height: 30),
        const IntoActions(),
      ],
    );
  }

  _getTextAlign(double screenWidth) {
    return screenWidth < DeviceType.mobile.getMaxWidth()
        ? TextAlign.center
        : TextAlign.start;
  }
}
