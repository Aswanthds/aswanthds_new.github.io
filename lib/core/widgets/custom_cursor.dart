import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_colors.dart';

class CustomCursor extends StatefulWidget {
  const CustomCursor({super.key, required this.child});
  final Widget child;

  @override
  State<CustomCursor> createState() => _CustomCursorState();
}

class _CustomCursorState extends State<CustomCursor>
    with SingleTickerProviderStateMixin {
  Offset _dotPosition = Offset.zero;
  Offset _ringPosition = Offset.zero;
  bool _isHovering = false;
  bool _isClicking = false;

  @override
  Widget build(BuildContext context) {
    // We use a simple TweenAnimationBuilder for the smooth "tracking" effect of the ring
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _dotPosition = event.localPosition;
        });
      },
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isClicking = true),
        onTapUp: (_) => setState(() => _isClicking = false),
        child: Stack(
          children: [
            widget.child,
            if (_isHovering) ...[
              // Trailing Smooth Ring
              TweenAnimationBuilder<Offset>(
                tween: Tween(begin: _ringPosition, end: _dotPosition),
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOutCubic,
                builder: (context, pos, child) {
                  return Positioned(
                    left: pos.dx - 20,
                    top: pos.dy - 20,
                    child: IgnorePointer(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: _isClicking ? 30 : 40,
                        height: _isClicking ? 30 : 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primaryColor.withOpacity(0.5),
                            width: 1.5,
                          ),
                          color: AppColors.primaryColor.withOpacity(0.05),
                        ),
                      ),
                    ),
                  );
                },
              ),
              // Precise Center Dot
              Positioned(
                left: _dotPosition.dx - 4,
                top: _dotPosition.dy - 4,
                child: IgnorePointer(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentColor.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
