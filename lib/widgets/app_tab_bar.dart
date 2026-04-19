import 'package:clipflow/widgets/glass_card.dart';
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onTap;

  const AppTabBar({super.key, required this.activeIndex, required this.onTap});

  static const _tabs = [
    _TabItem(icon: Icons.content_paste_outlined, label: 'Feed'),
    _TabItem(icon: Icons.description_outlined, label: 'Transfer'),
    _TabItem(icon: Icons.devices_outlined, label: 'Devices'),
    _TabItem(icon: Icons.settings_remote_outlined, label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Text('Hello', style: TextStyle(color: Colors.red[600])),
    );
  }
}

class _TabItem {
  final IconData icon;
  final String label;
  const _TabItem({required this.icon, required this.label});
}
