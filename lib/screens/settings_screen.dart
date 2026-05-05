import 'package:clipflow/theme/colors.dart';
import 'package:clipflow/widgets/glass_card.dart';
import 'package:clipflow/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ScreenHeader(
            title: 'Settings',
            pretitle: 'Account',
            sub: 'v2.24.1 · build 8812',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: GlassCard(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color.fromARGB(255, 104, 167, 229),
                          const Color.fromARGB(255, 37, 154, 249),
                        ],
                      ),
                    ),
                    child: Text(
                      'MR',
                      style: TextStyle(
                        color: kTealDark,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Morgan Rivera',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.2,
                          ),
                        ),
                        Text(
                          'morgan@rivera.studio',
                          style: TextStyle(color: kWhite45, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: kTeal.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'PRO',
                      style: TextStyle(
                        color: kTeal,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              children: [
                _SettingsGroup(
                  label: 'SYNC',
                  children: [
                    _SettingsRow(
                      icon: Icons.flash_auto,
                      iconColor: Color(0xff22e0c8).withValues(alpha: 0.15),
                      title: 'Universal Clipboard',
                    ),
                    _SettingsRow(
                      icon: Icons.flash_auto,
                      iconColor: Color(0xff22e0c8).withValues(alpha: 0.15),
                      title: 'iCloud Backup',
                      detail: 'Enabled',
                    ),
                    _SettingsRow(
                      icon: Icons.history,
                      iconColor: Color(0xff22e0c8).withValues(alpha: 0.15),
                      title: 'History Retention',
                      isLast: true,
                      detail: '30 days',
                    ),
                  ],
                ),
                _SettingsGroup(label: 'Privacy', children: []),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  final String label;
  final List<Widget> children;

  const _SettingsGroup({required this.label, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 8),
            child: Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: kWhite45,
                letterSpacing: 1,
                fontFamily: 'Courier',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GlassCard(child: Column(children: children)),
          ),
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? detail;
  final bool? toggleValue;
  final ValueChanged<bool>? onToggle;

  final bool isLast;
  const _SettingsRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.detail,
    this.toggleValue,
    this.onToggle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(
                  bottom: BorderSide(
                    color: Colors.white.withValues(alpha: 0.06),
                    width: 0.5,
                  ),
                ),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.06),
                  width: 0.5,
                ),
              ),
              child: Icon(icon, size: 15, color: Colors.white),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (detail != null) ...[
              Text(
                detail!,
                style: TextStyle(
                  fontSize: 13,
                  color: kWhite45,
                  fontFamily: 'Courier',
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.chevron_right, size: 14, color: kWhite30),
            ],
            if (toggleValue != null) Text('arrow'),
          ],
        ),
      ),
    );
  }
}
