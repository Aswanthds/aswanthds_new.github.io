import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_constants.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/data/models/custom_service.dart';

class BasicServiceItem extends StatefulWidget {
  const BasicServiceItem(
      {Key? key, required this.service, required this.mainIndx})
      : super(key: key);

  final Skills service;
  final int mainIndx;

  @override
  State<BasicServiceItem> createState() => _BasicServiceItemState();
}

class _BasicServiceItemState extends State<BasicServiceItem> {
  Color itemColor = AppColors.darkColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: itemColor,
      child: MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   widget.service.logo,
            //   height: 48,
            // ),
            // const SizedBox(height: 16),
            if (context.width > DeviceType.mobile.getMinWidth())
              FittedBox(
                child: Column(
                  children: [
                    Text(
                      widget.service.heading,
                      style: AppStyles.s24,
                      // minFontSize: 8,
                      textAlign: TextAlign.justify,
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List<Widget>.generate(
                            AppConstants
                                .services[widget.mainIndx].values.length,
                            (index) => Text(
                                  AppConstants
                                      .services[widget.mainIndx].values[index],
                                  style: AppStyles.s16,
                                  textAlign: TextAlign.left,
                                ))),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            //_buildServiceDetails(),
          ],
        ),
      ),
    );
  }
//  Text(
  //   widget.service.values,
  //   style: AppStyles.s24,
  //   // minFontSize: 8,
  //   textAlign: TextAlign.center,
  // ),

  void _onExit(event) {
    setState(() => itemColor = AppColors.darkColor);
  }

  void _onEnter(event) {
    setState(() => itemColor = AppColors.primaryColor);
  }
}
