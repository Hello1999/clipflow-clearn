import 'dart:ui';

import 'package:clipflow/theme/colors.dart';
import 'package:clipflow/widgets/glass_card.dart';
import 'package:clipflow/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class ClipboardFeedScreen extends StatefulWidget {
  const ClipboardFeedScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ClipboardFeedScreenState();
}

class _ClipboardFeedScreenState extends State<ClipboardFeedScreen> {
  int _activeFilter = 0;

  static const List<_FilterItem> _filters = [
    _FilterItem(label: 'All', count: 47),
    _FilterItem(label: 'Text', count: 28),
    _FilterItem(label: 'Links', count: 11),
    _FilterItem(label: 'Images', count: 6),
    _FilterItem(label: 'Code', count: 2),
    _FilterItem(label: 'Others', count: 58),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppStatusBar(),
          ScreenHeader(
            pretitle: 'CLIPFLOW',
            title: 'Clipboard',
            sub: '47 items . synced 2s ago',
            trailing: GlassCard(
              borderRadius: BorderRadius.circular(18),
              padding: EdgeInsets.all(10),
              child: Icon(Icons.search, size: 16, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: _filters.length,
              separatorBuilder: (i, _) => SizedBox(width: 6),
              itemBuilder: (context, i) {
                final f = _filters[i];
                final isOn = i == _activeFilter;

                return GestureDetector(
                  onTap: () => setState(() => _activeFilter = i),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 180),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isOn ? kTeal : kWhite5,
                      borderRadius: BorderRadius.circular(12),
                      border: isOn
                          ? null
                          : Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                              width: 0.5,
                            ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          f.label,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isOn ? kTealDark : kWhite60,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          '${f.count}',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Courier',
                            color: (isOn ? kTealDark : kWhite60).withValues(
                              alpha: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Just now',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: kWhite45,
                    fontFamily: 'Courier',
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: kTeal,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: kTeal, blurRadius: 8)],
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'LIVE',
                      style: TextStyle(
                        fontSize: 11,
                        color: kTeal,
                        fontFamily: 'Courier',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 120),
              children: [
                _ClipCard(
                  icon: Icons.link,
                  source: 'Safari . iPhone',
                  time: 'Just now',
                  accent: true,
                  pinned: false,
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.45,
                        letterSpacing: -0.15,
                      ),
                      children: [
                        TextSpan(
                          text: 'figma.com',
                          style: TextStyle(color: kTeal),
                        ),
                        const TextSpan(
                          text: '/file/k3Mx…/ClipFlow-Designs',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _ClipCard(
                  icon: Icons.code,
                  source: 'Terminal . Macbook Pro',
                  pinned: true,
                  time: '1m',
                  child: RichText(
                    text: TextSpan(text: '\$ git checkout -b feat/share-sheet'),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Earlier today',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: kWhite45,
                      letterSpacing: 1,
                      fontFamily: 'Courier',
                    ),
                  ),
                ),
                _ClipCard(
                  icon: Icons.text_fields,
                  source: 'Notes . iPad',
                  time: '14m',
                  child: Text(
                    'Move the onboarding handoff to Thursday — keep Eng async on the API review.',
                  ),
                ),
                SizedBox(height: 10),
                _ClipCard(
                  icon: Icons.note,
                  source: 'Messages . iPhone',
                  time: '1h',
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.45,
                        letterSpacing: -0.15,
                      ),
                      children: [
                        TextSpan(text: 'hotel confirmation: '),
                        TextSpan(
                          text: '#A2-7841-22B',
                          style: TextStyle(color: kTeal, fontFamily: 'Courier'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _ClipCard(
                  icon: Icons.text_fields,
                  source: 'Slack . Macbook Pro',
                  time: '2h',
                  child: Text(
                    'Design review at 3pm - make sure to pull the latest Figma branch before',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClipCard extends StatelessWidget {
  final IconData icon;
  final String source;
  final String time;
  final Widget child;
  final bool accent;
  final bool pinned;

  _ClipCard({
    required this.icon,
    required this.source,
    required this.time,
    required this.child,
    this.accent = false,
    this.pinned = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.045),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: accent
                  ? kTeal.withValues(alpha: 0.3)
                  : Colors.white.withValues(alpha: 0.1),
              width: 0.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: accent ? kTealDim : kWhite5,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Icon(
                      icon,
                      size: 12,
                      color: accent ? kTeal : kWhite60,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      source,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: kWhite60,
                      ),
                    ),
                  ),
                  if (pinned) ...[
                    Icon(Icons.push_pin, size: 11, color: kTeal),
                    const SizedBox(width: 6),
                  ],
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 11,
                      color: kWhite30,
                      fontFamily: 'Courier',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterItem {
  final String label;
  final int count;
  const _FilterItem({required this.label, required this.count});
}
