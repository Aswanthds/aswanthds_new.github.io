import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';
import 'package:portfolio/core/widgets/fade_in_up.dart';

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
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 200),
          child: Text(
            AppStrings.helloIM,
            style: context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()
                ? AppStyles.s16
                : AppStyles.s32.copyWith(color: AppColors.white),
            textAlign: _getTextAlign(context.mediaQueryWidth),
          ),
        ),
        const SizedBox(height: 8),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 400),
          child: _ShinyText(
            text: AppStrings.developerName,
            style:
                (context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()
                        ? AppStyles.s24
                        : AppStyles.s52)
                    .copyWith(
                      height: 1.1,
                      shadows: [
                        Shadow(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          blurRadius: 30,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
            textAlign: _getTextAlign(context.mediaQueryWidth),
          ),
        ),
        const SizedBox(height: 16),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 600),
          child: SizedBox(
            width: context.mediaQueryWidth < DeviceType.mobile.getMaxWidth()
                ? context.mediaQueryWidth - 40
                : context.mediaQueryWidth / 2.5,
            child: Text(
              AppStrings.introMsg,
              style:
                  (context.mediaQueryWidth < DeviceType.ipad.getMaxWidth()
                          ? AppStyles.s14
                          : AppStyles.s18)
                      .copyWith(
                        color: AppColors.white.withOpacity(0.8),
                        height: 1.5,
                        letterSpacing: 0.5,
                      ),
              textAlign: _getTextAlign(context.mediaQueryWidth),
              softWrap: true,
            ),
          ),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 800),
          child: const IntoActions(),
        ),
      ],
    );
  }

  TextAlign _getTextAlign(double screenWidth) {
    return screenWidth < DeviceType.mobile.getMaxWidth()
        ? TextAlign.center
        : TextAlign.start;
  }
}

class _ShinyText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  const _ShinyText({
    required this.text,
    required this.style,
    required this.textAlign,
  });

  @override
  State<_ShinyText> createState() => _ShinyTextState();
}

class _ShinyTextState extends State<_ShinyText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryColor,
                AppColors.accentColor,
                AppColors.white,
                AppColors.accentColor,
                AppColors.primaryColor,
              ],
              stops: [
                0.0,
                (_controller.value - 0.15).clamp(0.0, 1.0),
                _controller.value,
                (_controller.value + 0.15).clamp(0.0, 1.0),
                1.0,
              ],
            ).createShader(bounds);
          },
          child: Text(
            widget.text,
            style: widget.style.copyWith(color: Colors.white),
            textAlign: widget.textAlign,
          ),
        );
      },
    );
  }
}
