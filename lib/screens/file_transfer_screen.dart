import 'package:clipflow/theme/colors.dart';
import 'package:clipflow/widgets/glass_card.dart';
import 'package:clipflow/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class FileTransferScreen extends StatelessWidget {
  const FileTransferScreen({super.key});

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
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            kTeal.withValues(alpha: 0.25),
                            Colors.transparent,
                          ],
                          stops: [0, 0.7],
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
                      SizedBox(height: 20),
                      Row(
                        children: [
                          _RingProgress(progress: 0.5),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('99.2 / 148.2 MB'),
                              SizedBox(height: 4),
                              Text(
                                '12.4 MB/s . 4s reamining',
                                style: TextStyle(
                                  color: kWhite45,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  _ActionButton(
                                    icon: Icons.pause,
                                    label: 'Pause',
                                    onTap: () => {},
                                  ),
                                  SizedBox(width: 8),
                                  _ActionButton(
                                    label: 'Cancel',
                                    onTap: () => {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'RECENT',
                      style: TextStyle(
                        color: kWhite45,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Courier',
                        letterSpacing: 1,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      'Today',
                      style: TextStyle(
                        color: kWhite45,
                        fontFamily: 'Courier',
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                _TransferCard(
                  name: 'brand-guidelines.pdf',
                  size: '4.2 MB',
                  from: 'iPad',
                  to: 'iPhone',
                  kind: 'PDF',
                  status: _TransferStatus.active,
                  progress: 1.0,
                ),
                SizedBox(height: 10),
                _TransferCard(
                  name: 'studio_shot_07.png',
                  size: '12.8 MB',
                  from: 'iPhone',
                  to: 'MacBook',
                  kind: 'PDF',
                  status: _TransferStatus.done,
                  progress: 1.0,
                ),
                SizedBox(height: 10),
                _TransferCard(
                  name: 'onboarding.mov',
                  size: '116.4 MB',
                  from: 'MacBook',
                  to: 'iPad',
                  kind: 'MOV',
                  status: _TransferStatus.paused,
                  progress: 1.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(Icons.pause, size: 10, color: Colors.white),
              SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
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

    final progressPaint = Paint()
      ..color = teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3);

    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _RingProgress extends StatelessWidget {
  final double progress;

  const _RingProgress({required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: CustomPaint(
        painter: _RingPainter(progress: progress, teal: kTeal),
        child: Center(
          child: Text(
            '${(progress * 100).toInt()}%',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

enum _TransferStatus { active, done, paused }

class _TransferCard extends StatelessWidget {
  final String name;
  final String size;
  final String from;
  final String to;
  final String kind;
  final _TransferStatus status;
  final double progress;

  const _TransferCard({
    required this.name,
    required this.size,
    required this.from,
    required this.to,
    required this.kind,
    required this.status,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = status == _TransferStatus.active;
    final isDone = status == _TransferStatus.done;

    return GlassCard(
      borderRadius: BorderRadius.circular(18),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isActive ? kTealDim : kWhite5,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                    width: 0.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    kind,
                    style: TextStyle(
                      fontSize: 9,
                      fontFamily: 'Courier',
                      fontWeight: FontWeight.w700,
                      color: isActive ? kTeal : kWhite60,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: -0.2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '$size · $from → $to',
                      style: TextStyle(fontSize: 11, color: kWhite45),
                    ),
                  ],
                ),
              ),

              if (isDone)
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: kTealDim,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, size: 14, color: kTeal),
                )
              else
                Icon(
                  status == _TransferStatus.paused
                      ? Icons.download_outlined
                      : Icons.close,
                  size: 16,
                  color: kWhite45,
                ),
            ],
          ),

          if (!isDone) ...[
            SizedBox(height: 12),

            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Stack(
                children: [
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: status == _TransferStatus.paused
                          ? kWhite30
                          : kTeal,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: progress,
                    child: Container(
                      height: 3,
                      decoration: BoxDecoration(
                        color: status == _TransferStatus.paused
                            ? kWhite30
                            : kTeal,
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: status == _TransferStatus.paused
                            ? null
                            : [BoxShadow(color: kTeal, blurRadius: 8)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(progress * 100).toInt()}% · ${(status == _TransferStatus.paused ? 'paused' : '12.4 MB/s')}',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Courier',
                    color: kWhite45,
                  ),
                ),
                Text(
                  status == _TransferStatus.paused ? '—' : '0:08 remaining',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Courier',
                    color: kWhite45,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
