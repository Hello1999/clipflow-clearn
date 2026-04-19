import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final bool strong;
  final Border? border;
  final double blueSigma;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.strong = false,
    this.border,
    this.blueSigma = 24,
  });

  @override
  Widget build(BuildContext context) {
    final br = borderRadius ?? BorderRadius.circular(20);
    return ClipRRect(
      borderRadius: br,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blueSigma, sigmaY: blueSigma),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: strong ? 0.07 : 0.045),
            borderRadius: br,
            border:
                border ??
                Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                  width: 0.5,
                ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.05),
                blurRadius: 0,
                spreadRadius: 0,
                offset: Offset(0, 0.5),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
