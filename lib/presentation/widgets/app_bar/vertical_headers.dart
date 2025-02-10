import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/config/extensions.dart';

import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_extensions.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import 'custom_header_btn.dart';

class VerticalHeaders extends StatelessWidget {
  const VerticalHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (context.mediaQueryWidth > DeviceType.ipad.getMaxWidth()) {
          return const SizedBox();
        }
        return SizedBox(
          width: context.mediaQueryWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              AppBarHeaders.values.length,
              (index) => SizedBox(
                width: context.mediaQueryWidth,
                child: CustomHeaderBtn(headerIndex: index),
              ),
            ),
          ),
        );
      },
    );
  }
}
