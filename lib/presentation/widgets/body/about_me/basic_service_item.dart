import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/config/extensions.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_constants.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/data/models/custom_service.dart';

class BasicServiceItem extends StatefulWidget {
  const BasicServiceItem({
    super.key,
    required this.service,
    required this.mainIndx,
  });

  final Skills service;
  final int mainIndx;

  @override
  State<BasicServiceItem> createState() => _BasicServiceItemState();
}

class _BasicServiceItemState extends State<BasicServiceItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isHovered
                      ? AppColors.primaryColor.withOpacity(0.5)
                      : Colors.white.withOpacity(0.1),
                  width: 1.5,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    isHovered
                        ? AppColors.primaryColor.withOpacity(0.2)
                        : Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.02),
                  ],
                ),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ]
                    : [],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Semantics(
                    label: '${widget.service.heading} logo',
                    child: SvgPicture.asset(
                      widget.service.logo,
                      height: 48,
                      colorFilter: ColorFilter.mode(
                        isHovered
                            ? AppColors.white
                            : AppColors.white.withOpacity(0.8),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.service.heading,
                    style: AppStyles.s20.copyWith(
                      color: isHovered
                          ? AppColors.primaryColor
                          : AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  if (context.mediaQueryWidth > DeviceType.mobile.getMinWidth())
                    Text(
                      AppConstants.services[widget.mainIndx].values.join(', '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.s14.copyWith(
                        color: AppColors.white.withValues(alpha: 0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
