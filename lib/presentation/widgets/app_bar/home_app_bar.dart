import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_extensions.dart';
import 'custom_menu_btn.dart';
import 'developer_name_btn.dart';
import 'horizontal_headers.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 72,
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(context),
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1), // subtle tint
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DeveloperNameBtn(),
              context.mediaQueryWidth >=
                      DeviceType.smallScreenLaptop.getMaxWidth()
                  ? const HorizontalHeaders()
                  : const CustomMenuBtn(),
            ],
          ),
        ),
      ),
    );
  }

  double _getHorizontalPadding(BuildContext context) {
    if (context.mediaQueryWidth <= DeviceType.ipad.getMaxWidth()) {
      return context.mediaQueryWidth * .03;
    } else {
      return context.mediaQueryWidth * .08;
    }
  }
}
