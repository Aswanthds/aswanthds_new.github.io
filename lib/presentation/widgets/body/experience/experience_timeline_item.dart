import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/app_colors.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/data/models/experience.dart';
import 'package:portfolio/core/utils/app_enums.dart';
import 'package:portfolio/core/utils/app_extensions.dart';
import 'package:universal_html/html.dart' as html;

class ExperienceTimelineItem extends StatefulWidget {
  const ExperienceTimelineItem({
    super.key,
    required this.experience,
    required this.isLast,
  });

  final Experience experience;
  final bool isLast;

  @override
  State<ExperienceTimelineItem> createState() => _ExperienceTimelineItemState();
}

class _ExperienceTimelineItemState extends State<ExperienceTimelineItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator Column
          SizedBox(
            width: 20,
            child: Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppColors.primaryColor.withOpacity(0.2),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: isMobile ? 12 : 24),
          // Content Card
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isMobile ? 24 : 32),
              child: MouseRegion(
                onEnter: (_) => setState(() => isHovered = true),
                onExit: (_) => setState(() => isHovered = false),
                child: AnimatedScale(
                  scale: isHovered ? 1.01 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: EdgeInsets.all(isMobile ? 16 : 20),
                        clipBehavior: .antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.03),
                          border: Border.all(
                            color: isHovered
                                ? AppColors.primaryColor.withOpacity(0.5)
                                : Colors.white.withOpacity(0.05),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header: Role, Company and Period
                            isMobile
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _PeriodBadge(
                                        period: widget.experience.period,
                                      ),
                                      const SizedBox(height: 12),
                                      _RoleInfo(experience: widget.experience),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: _RoleInfo(
                                          experience: widget.experience,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      _PeriodBadge(
                                        period: widget.experience.period,
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 16),
                            Text(
                              "Project: ${widget.experience.project}",
                              style: (isMobile ? AppStyles.s14 : AppStyles.s16)
                                  .copyWith(
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            ...widget.experience.bulletPoints.map(
                              (point) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Icon(
                                        Icons.circle,
                                        size: 6,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        point,
                                        style:
                                            (isMobile
                                                    ? AppStyles.s14
                                                    : AppStyles.s14)
                                                .copyWith(
                                                  color: AppColors.white
                                                      .withOpacity(0.7),
                                                  height: 1.5,
                                                ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (widget.experience.googlePlay != null ||
                                widget.experience.appStore != null) ...[
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 8,
                                children: [
                                  if (widget.experience.googlePlay != null)
                                    _LinkButton(
                                      icon: FontAwesomeIcons.googlePlay,
                                      label: 'Play Store',
                                      onTap: () => html.window.open(
                                        widget.experience.googlePlay!,
                                        '_blank',
                                      ),
                                    ),
                                  if (widget.experience.appStore != null)
                                    _LinkButton(
                                      icon: FontAwesomeIcons.appStoreIos,
                                      label: 'App Store',
                                      onTap: () => html.window.open(
                                        widget.experience.appStore!,
                                        '_blank',
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleInfo extends StatelessWidget {
  final Experience experience;
  const _RoleInfo({required this.experience});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.role,
          style: (isMobile ? AppStyles.s18 : AppStyles.s20).copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          experience.company,
          style: (isMobile ? AppStyles.s14 : AppStyles.s18).copyWith(
            color: AppColors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}

class _PeriodBadge extends StatelessWidget {
  final String period;
  const _PeriodBadge({required this.period});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        period,
        style: AppStyles.s14.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: AppColors.white),
            const SizedBox(width: 8),
            Text(label, style: AppStyles.s14),
          ],
        ),
      ),
    );
  }
}
