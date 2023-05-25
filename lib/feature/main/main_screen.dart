import 'package:flutter/material.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/feature/chat/chat_screen.dart';
import 'package:pine_app/feature/home/home_screen.dart';
import 'package:pine_app/feature/payments/payments_screen.dart';
import '../service/service_screen.dart';
import '../widget/bottom_bar/app_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List<String> get icons => [
        AppIcons.icHome,
        AppIcons.icWallet,
        AppIcons.icChat,
        AppIcons.icMain,
      ];
  List<Widget> get screens => [
        const HomeScreen(),
        const PaymentsScreen(),
        const ChatScreen(),
        const ServiceScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[_currentIndex],
      bottomNavigationBar: AppBottomBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        icons: icons,
      ),
    );
  }
}
