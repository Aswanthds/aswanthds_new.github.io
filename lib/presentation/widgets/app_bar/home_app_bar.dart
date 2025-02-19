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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.appBarColor,
            AppColors.appBarColor,
            AppColors.appBarColor,
            AppColors.appBarColor.withAlpha(170),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: _getHorizontalPadding(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DeveloperNameBtn(),
          context.mediaQueryWidth >= DeviceType.smallScreenLaptop.getMaxWidth()
              ? const HorizontalHeaders()
              : const CustomMenuBtn()
        ],
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
