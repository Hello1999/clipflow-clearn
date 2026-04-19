import 'package:clipflow/theme/colors.dart';
import 'package:clipflow/widgets/app_tab_bar.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ClipflowApp());
}

class ClipflowApp extends StatelessWidget {
  const ClipflowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: kTeal,
          surface: kBg,
          onSurface: Colors.white,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: kBg,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      home: MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<StatefulWidget> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  static const _screens = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      extendBody: true,
      body: Stack(
        children: [
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: AppTabBar(activeIndex: 1, onTap: (i) => {}),
          ),
        ],
      ),
    );
  }
}
