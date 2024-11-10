import 'package:flutter/material.dart';

import 'chat/chat_view.dart';
import 'competations/competations_view.dart';
import 'home/home_view.dart';
import 'menu/menu_view.dart';
import 'notifications/notifications_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 4;

  final screens = const [
    MenuPage(),
    CompetationsPage(),
    ChatPage(),
    NotificationsPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.timer, size: 30),
      const Icon(Icons.card_giftcard, size: 30),
      const Icon(Icons.person, size: 30),
    ];
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color(0xff6D00B5),
          unselectedItemColor: const Color(0xffBAC0CA),
          currentIndex: index,
          onTap: (index) => setState(() => this.index = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined), label: "القائمة"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet), label: "المسابقات"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "الدردشة"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "الاشعارات"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية")
          ],
        ),
      ),
    );
  }
}
