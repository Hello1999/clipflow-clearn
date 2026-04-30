import 'package:clipflow/theme/colors.dart';
import 'package:clipflow/widgets/glass_card.dart';
import 'package:clipflow/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenHeader(
            title: 'Devices',
            pretitle: 'NETWORK',
            sub: '3 online · 1 idle',
            trailing: GlassCard(
              borderRadius: BorderRadius.circular(18),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.add, size: 16, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text(
              'PAIRED · 4',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: kWhite45,
                letterSpacing: 1,
                fontFamily: 'Courier',
              ),
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 120),
              children: [
                _DeviceCard(
                  icon: Icons.phone_iphone,
                  name: 'iPhone 17 Pro',
                  kind: 'ios 26.1 · syncing now',
                  status: _DeviceStatus.online,
                  lasySync: 'sycing now',
                  battery: 84,
                ),
                SizedBox(height: 10),
                _DeviceCard(
                  name: 'MacBook Pro 16"',
                  kind: 'macOS 16.0',
                  status: _DeviceStatus.offline,
                  battery: 62,
                  lasySync: 'synced 4s ago',
                  icon: Icons.laptop_mac,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum _DeviceStatus { online, offline }

class _DeviceCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String kind;
  final _DeviceStatus status;
  final int? battery;
  final bool thisDevice;
  final String lasySync;

  const _DeviceCard({
    required this.icon,
    required this.name,
    required this.kind,
    required this.status,
    this.battery,
    this.thisDevice = false,
    required this.lasySync,
  });

  @override
  Widget build(BuildContext context) {
    final isOnline = status == _DeviceStatus.online;

    return GlassCard(
      borderRadius: BorderRadius.circular(18),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: kTealDim,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                    width: 0.5,
                  ),
                ),
                child: Icon(icon, size: 20, color: isOnline ? kTeal : kWhite45),
              ),
              Positioned(
                bottom: -2,
                right: -2,

                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: isOnline ? kTeal : kWhite30,
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xff0b0b10), width: 2),
                    boxShadow: isOnline
                        ? [BoxShadow(color: kTeal, blurRadius: 6)]
                        : null,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 14),
          Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Row(children: [Text(name), Text('This DEVICE')]),
                    Text(kind),
                    Text(lasySync),
                  ],
                ),
              ],
            ),
          ),
          Text(battery.toString()),
        ],
      ),
    );
  }
}
