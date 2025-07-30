import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_extensions.dart';
import 'package:universal_html/html.dart' as html;
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_styles.dart';
import '../../blocs/home_bloc/home_bloc.dart';

class CustomHeaderBtn extends StatelessWidget {
  const CustomHeaderBtn({super.key, required this.headerIndex});

  final int headerIndex;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        context.read<HomeBloc>().add(ChangeAppBarHeadersIndex(headerIndex));
        if (headerIndex == 4) {
          var uri =
              "https://drive.google.com/file/d/1NKp5q2BqcpEpahzPp4h9p2gBHfkbO5Pq/view";

          html.window.open(uri, '_blank');
        }
      },
      style: TextButton.styleFrom(
        textStyle: AppStyles.s16,
        foregroundColor: _getHeaderColor(
          currentIndex: context.read<HomeBloc>().appBarHeaderIndex,
          headerIndex: headerIndex,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 26,
        ),
        child: Text(
          AppBarHeaders.values[headerIndex].getString(),
        ),
      ),
    );
  }

  Color _getHeaderColor({required currentIndex, required int headerIndex}) {
    if (currentIndex == headerIndex) {
      return AppColors.primaryColor;
    } else {
      return AppColors.white;
    }
  }
}
