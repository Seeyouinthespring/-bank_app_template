import 'package:bank_app_template/routes.dart';
import 'package:bank_app_template/screens/home_screen.dart';
import 'package:bank_app_template/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'models/navigation_index_model.dart';

class CustomNavigation extends StatelessWidget {
  CustomNavigation({super.key, required this.title});

  final String title;

  final screens = [
    HomeScreen(),
    const Center(
      child: Text(
        'Purchases',
        style: TextStyle(fontSize: 30),
      ),
    ),
    const Center(
      child: Text(
        'Payments',
        style: TextStyle(fontSize: 30),
      ),
    ),
    const Center(
      child: Text(
        'Chat',
        style: TextStyle(fontSize: 30),
      ),
    ),
    const Center(
      child: Text(
        'Bonuses',
        style: TextStyle(fontSize: 30),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Color(0xFF02A1FB),
      ),
    );

    return Consumer<NavigationIndexModel>(builder: (context, service, child) {
      return Scaffold(
        body: service.route == Routes.profile
            ? const ProfileScreen()
            : screens[service.index],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 6,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: service.index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) => service.resetIndex(index),
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/home.svg',
                color: const Color(0xFF979797),
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/home.svg',
                color: const Color(0xFF00A3FF),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/purchases.svg',
                color: const Color(0xFF979797),
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/purchases.svg',
                color: const Color(0xFF00A3FF),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/payments.svg',
                color: const Color(0xFF979797),
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/payments.svg',
                color: const Color(0xFF00A3FF),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/chat.svg',
                color: const Color(0xFF979797),
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/chat.svg',
                color: const Color(0xFF00A3FF),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/bonuses.svg',
                color: const Color(0xFF979797),
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/bonuses.svg',
                color: const Color(0xFF00A3FF),
              ),
              label: '',
            ),
          ],
        ),
      );
    });
  }
}
