import 'package:clipflow/theme/colors.dart';
import 'package:clipflow/widgets/glass_card.dart';
import 'package:clipflow/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool _universalClipboard = true;
  bool _e2eEncryption = true;
  bool _excludePasswords = true;
  bool _localNetworkOnly = false;

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
                  label: 'Sync',
                  children: [
                    _SettingsRow(
                      icon: Icons.bolt_outlined,
                      iconColor: const Color(0xFF22E0C8).withOpacity(0.15),
                      title: 'Universal Clipboard',
                      toggleValue: _universalClipboard,
                      onToggle: (v) => setState(() => _universalClipboard = v),
                    ),
                    _SettingsRow(
                      icon: Icons.cloud_outlined,
                      iconColor: Colors.white.withOpacity(0.08),
                      title: 'iCloud Backup',
                      detail: 'Enabled',
                    ),
                    _SettingsRow(
                      icon: Icons.history,
                      iconColor: Colors.white.withOpacity(0.08),
                      title: 'History Retention',
                      detail: '30 days',
                      isLast: true,
                    ),
                  ],
                ),
                _SettingsGroup(
                  label: 'Privacy',
                  children: [
                    _SettingsRow(
                      icon: Icons.lock_outline,
                      iconColor: Colors.white.withOpacity(0.08),
                      title: 'End-to-End Encryption',
                      toggleValue: _e2eEncryption,
                      onToggle: (v) => setState(() => _e2eEncryption = v),
                    ),
                    _SettingsRow(
                      icon: Icons.shield_outlined,
                      iconColor: Colors.white.withOpacity(0.08),
                      title: 'Exclude Passwords',
                      toggleValue: _excludePasswords,
                      onToggle: (v) => setState(() => _excludePasswords = v),
                    ),
                    _SettingsRow(
                      icon: Icons.notifications_outlined,
                      iconColor: Colors.white.withOpacity(0.08),
                      title: 'Sync Notifications',
                      detail: 'Silent',
                      isLast: true,
                    ),
                  ],
                ),
                _SettingsGroup(
                  label: 'Advanced',
                  children: [
                    _SettingsRow(
                      icon: Icons.wifi,
                      iconColor: Colors.white.withOpacity(0.08),
                      title: 'Local Network Only',
                      toggleValue: _localNetworkOnly,
                      onToggle: (v) => setState(() => _localNetworkOnly = v),
                      isLast: true,
                    ),
                  ],
                ),
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
      onTap: toggleValue != null ? () => onToggle?.call(!toggleValue!) : null,
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
            if (toggleValue != null)
              _Toggle(value: toggleValue!, onChanged: onToggle ?? (_) {}),
          ],
        ),
      ),
    );
  }
}

class _Toggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _Toggle({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 42,
        height: 24,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: value ? kTeal : Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: AnimatedAlign(
          alignment: value
              ? Alignment.centerRight
              : AlignmentGeometry.centerLeft,
          duration: Duration(milliseconds: 200),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
