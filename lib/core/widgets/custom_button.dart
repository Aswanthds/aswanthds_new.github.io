import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.height,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.borderColor,
    this.onPressed,
    this.semanticsLabel,
    this.width,
  });

  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? height;
  final IconData? icon;
  final String label;
  final String? semanticsLabel;
  final double? width;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel ?? widget.label,
      button: true,
      enabled: widget.onPressed != null,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: widget.height ?? 48,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              if (isHovered && widget.onPressed != null)
                BoxShadow(
                  color: (widget.backgroundColor ?? AppColors.primaryColor)
                      .withOpacity(0.4),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
            ],
          ),
          child: OutlinedButton(
            onPressed: widget.onPressed,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: isHovered
                    ? (widget.borderColor ?? AppColors.primaryColor)
                    : (widget.borderColor?.withOpacity(0.5) ?? Colors.white24),
                width: isHovered ? 2 : 1,
              ),
              backgroundColor: isHovered
                  ? (widget.backgroundColor?.withOpacity(0.9) ??
                        AppColors.primaryColor)
                  : (widget.backgroundColor ?? Colors.transparent),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AutoSizeText(
                    widget.label,
                    style: AppStyles.s16.copyWith(
                      color: AppColors.white,
                      fontWeight: isHovered
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                ),
                if (widget.icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(widget.icon, size: 20, color: AppColors.white),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
