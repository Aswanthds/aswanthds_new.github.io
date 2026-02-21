import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../data/models/project.dart';
import 'project_image.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({super.key, required this.project});
  final Project project;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(isMobile ? 12 : 16),
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
                        ? AppColors.primaryColor.withOpacity(0.1)
                        : Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.02),
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProjectImage(
                    imageUrl: widget.project.imageUrl,
                    projectName: widget.project.name,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.project.name,
                    style: (isMobile ? AppStyles.s18 : AppStyles.s20).copyWith(
                      color: isHovered
                          ? AppColors.primaryColor
                          : AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.project.description,
                    style: (isMobile ? AppStyles.s12 : AppStyles.s14).copyWith(
                      color: AppColors.white.withOpacity(0.7),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _ProjectActionsStatic(project: widget.project),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectActionsStatic extends StatelessWidget {
  final Project project;
  const _ProjectActionsStatic({required this.project});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        if (project.previewLink != null)
          _SmallButton(
            label: 'Preview',
            color: AppColors.primaryColor,
            onPressed: () => html.window.open(project.previewLink!, '_blank'),
          ),
        if (project.githubRepoLink != null)
          _SmallButton(
            label: 'Github',
            isOutlined: true,
            onPressed: () =>
                html.window.open(project.githubRepoLink!, '_blank'),
          ),
        if (project.googlePlay != null)
          _SmallButton(
            label: 'Live',
            isOutlined: true,
            onPressed: () => html.window.open(project.googlePlay!, '_blank'),
          ),
      ],
    );
  }
}

class _SmallButton extends StatelessWidget {
  final String label;
  final Color? color;
  final bool isOutlined;
  final VoidCallback onPressed;

  const _SmallButton({
    required this.label,
    required this.onPressed,
    this.color,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isOutlined
          ? Colors.transparent
          : (color ?? AppColors.primaryColor),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: isOutlined
                ? Border.all(color: AppColors.primaryColor)
                : null,
          ),
          child: Text(
            label,
            style: AppStyles.s14.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectItemWeb extends StatefulWidget {
  const ProjectItemWeb({super.key, required this.project});
  final Project project;

  @override
  State<ProjectItemWeb> createState() => _ProjectItemWebState();
}

class _ProjectItemWebState extends State<ProjectItemWeb> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isHovered
                      ? AppColors.primaryColor.withOpacity(0.6)
                      : Colors.white.withOpacity(0.1),
                  width: 2,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    isHovered
                        ? AppColors.primaryColor.withOpacity(0.15)
                        : Colors.white.withOpacity(0.08),
                    Colors.white.withOpacity(0.02),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProjectImageWeb(
                          imageUrl: widget.project.imageUrl,
                          projectName: widget.project.name,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            // Allow text to scroll internally if extremely long
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.project.name,
                                  style: AppStyles.s20.copyWith(
                                    color: isHovered
                                        ? AppColors.primaryColor
                                        : AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  widget.project.description,
                                  style: AppStyles.s14.copyWith(
                                    color: AppColors.white.withOpacity(0.8),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _ProjectActionsStatic(project: widget.project),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
