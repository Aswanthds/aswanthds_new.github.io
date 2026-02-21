import 'package:flutter/material.dart';
import 'package:portfolio/config/extensions.dart';
import 'package:portfolio/core/utils/app_colors.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../data/models/responsive_size.dart';

class IntroImage extends StatefulWidget {
  const IntroImage({super.key});

  @override
  State<IntroImage> createState() => _IntroImageState();
}

class _IntroImageState extends State<IntroImage> with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _rotateController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _rotateController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _floatAnimation = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(
      deviceWidth: context.mediaQueryWidth,
      mobileSize: context.mediaQueryWidth * .55,
      ipadSize: context.mediaQueryWidth * .36,
      smallScreenSize: context.mediaQueryWidth * .26,
    );

    final size = responsiveSize.getSize() ?? 300.0;

    return AnimatedBuilder(
      animation: Listenable.merge([_floatAnimation, _rotateController]),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Background Animated Sapphire Rings
            RotationTransition(
              turns: _rotateController,
              child: Container(
                width: size * 1.15,
                height: size * 1.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      AppColors.primaryColor.withOpacity(0.0),
                      AppColors.primaryColor.withOpacity(0.4),
                      AppColors.darkColor.withOpacity(0.4),
                      AppColors.darkColor.withOpacity(0.0),
                    ],
                    stops: const [0.0, 0.4, 0.6, 1.0],
                  ),
                ),
              ),
            ),
            // Outer Glow
            Container(
              width: size * 1.1,
              height: size * 1.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.15),
                    blurRadius: 60,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
            // Inner Cyber Glow
            Container(
              width: size * 0.9,
              height: size * 0.9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentColor.withOpacity(0.2),
                    blurRadius: 40,
                    spreadRadius: -5,
                  ),
                ],
              ),
            ),
            // Floating Image
            Transform.translate(
              offset: Offset(0, _floatAnimation.value),
              child: child!,
            ),
          ],
        );
      },
      child: Semantics(
        label: 'Portrait of Aswanth - Flutter Developer',
        image: true,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size),
          child: Image.asset(
            AppAssets.devImg,
            width: size,
            height: size,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.person, size: size, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
