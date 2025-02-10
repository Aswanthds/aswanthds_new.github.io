import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';
import 'package:universal_html/html.dart' as html;

import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';

class DeveloperNameBtn extends StatelessWidget {
  const DeveloperNameBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        html.window.location.reload();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: SizedBox(
          width: context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()
              ? context.mediaQueryWidth * .5
              : context.mediaQueryWidth * .2,
          child: FittedBox(
            alignment: Alignment.topLeft,
            child: Text(
              AppStrings.developerName,
              style: AppStyles.s28,
            ),
          ),
        ),
      ),
    );
  }
}
