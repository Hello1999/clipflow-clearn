import 'package:clipflow/theme/colors.dart';
import 'package:clipflow/widgets/glass_card.dart';
import 'package:clipflow/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenHeader(
            title: 'Files',
            sub: '1 active . 2.4GB/day',
            pretitle: 'TRANSFER',
            trailing: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: kTeal,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 14, color: kTealDark),
                    SizedBox(width: 4),
                    Text(
                      'Send',
                      style: TextStyle(
                        fontSize: 13,
                        color: kTealDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: GlassCard(
              padding: EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: -40,
                    right: -40,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            kTeal.withValues(alpha: 0.25),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: kTeal,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(color: kTeal, blurRadius: 10),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'TRANSFERRING',
                            style: TextStyle(
                              color: kTeal,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              fontFamily: 'Courier',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Keynote_Q2.sketch',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.4,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '148.2MB . MacbookPro -> iPhone 17',
                        style: TextStyle(
                          fontSize: 12,
                          color: kWhite45,
                          fontFamily: 'Courier',
                        ),
                      ),
                      Row(
                        children: [
                          CustomPaint(
                            size: Size(200, 200),
                            painter: _RingPainter(progress: 60, teal: kTeal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final Color teal;

  _RingPainter({required this.progress, required this.teal});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;
    final strokeWidth = 4.0;

    final trackPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, trackPaint);
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
