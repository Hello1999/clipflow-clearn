import 'package:clipflow/theme/colors.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final String? pretitle;
  final String? sub;
  final Widget? trailing;

  const ScreenHeader({
    super.key,
    required this.title,
    this.pretitle,
    this.sub,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (pretitle != null) ...[
            Text(
              pretitle!,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: kTeal,
                letterSpacing: 1.5,
                fontFamily: 'Courier',
              ),
            ),
            SizedBox(height: 8),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    if (sub != null) ...[
                      SizedBox(height: 6),
                      Text(
                        sub!,
                        style: TextStyle(
                          fontSize: 13,
                          color: kWhite45,
                          fontFamily: 'Courier',
                          letterSpacing: -0.1,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              ?trailing,
            ],
          ),
        ],
      ),
    );
  }
}
