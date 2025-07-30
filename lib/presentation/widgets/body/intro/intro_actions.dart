import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/config/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../blocs/home_bloc/home_bloc.dart';

class IntoActions extends StatelessWidget {
  const IntoActions({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [
      CustomButton(
        label: AppBarHeaders.aboutMe.getString(),
        icon: Icons.person,
        backgroundColor: AppColors.darkColor,
        onPressed: () {
          context.read<HomeBloc>().add(ChangeAppBarHeadersIndex(1));
        },
        width: 160,
      ),
      context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()
          ? const SizedBox(height: 6)
          : const SizedBox(width: 32),
      CustomButton(
        label: AppBarHeaders.projects.getString(),
        icon: Icons.remove_red_eye,
        backgroundColor: AppColors.darkColor,
        borderColor: AppColors.primaryColor,
        onPressed: () {
          context.read<HomeBloc>().add(ChangeAppBarHeadersIndex(2));
        },
        width: 160,
      ),
      context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()
          ? const SizedBox(height: 6)
          : const SizedBox(width: 32),
      CustomButton(
        label: AppBarHeaders.resume.getString(),
        icon: Icons.document_scanner,
        backgroundColor: AppColors.darkColor,
        onPressed: () {
          context.read<HomeBloc>().add(ChangeAppBarHeadersIndex(2));
          var uri =
              "https://drive.google.com/file/d/1g_3RbNGp0A6oM_OerR7kU42FQjSps3AF/view";

          html.window.open(uri, '_blank');
        },
        width: 160,
      ),
    ];
    return context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: actions,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: actions,
          );
  }
}
