import 'package:flutter/material.dart';

class AppStatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(32, 18, 32, 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: -0.3,
            ),
          ),
          Row(
            children: [
              _SignalBars(),
              SizedBox(width: 6),
              _WifiIcon(),
              SizedBox(width: 6),
              _BaterryIcon(),
            ],
          ),
        ],
      ),
    );
  }
}

class _SignalBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [_bar(4), _bar(6), _bar(9), _bar(11)],
      ),
    );
  }

  Widget _bar(double height) {
    return Container(
      width: 3,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.5),
      ),
    );
  }
}

class _WifiIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.wifi, color: Colors.white, size: 16);
  }
}

class _BaterryIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 13,
      child: Stack(
        children: [
          Container(
            width: 22,
            height: 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 4,
            child: Container(
              width: 2,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
