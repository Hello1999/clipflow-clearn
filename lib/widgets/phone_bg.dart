import 'dart:ui';

import 'package:clipflow/theme/colors.dart';
import 'package:flutter/material.dart';

class PhoneBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBg,
      child: Stack(
        children: [
          Positioned(
            top: -160,
            left: -120,
            child: Container(
              width: 440,
              height: 440,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [kTeal.withValues(alpha: 0.18), Colors.transparent],
                  stops: [0, 0.7],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -200,
            right: -120,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xff5078FF).withValues(alpha: 0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
