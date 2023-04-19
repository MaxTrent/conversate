import 'package:conversate/pages/calls.dart';
import 'package:conversate/pages/messages.dart';
import 'package:conversate/pages/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/contacts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _NavigationBarItem(
              label: 'Messaging',
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
            ),
            _NavigationBarItem(
              label: 'Notifications',
              icon: CupertinoIcons.bell_solid,
            ),
            _NavigationBarItem(
              label: 'Calls',
              icon: CupertinoIcons.phone_fill,
            ),
            _NavigationBarItem(
              label: 'Contacts',
              icon: CupertinoIcons.person_2,
            ),
          ],
        ));
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({Key? key, required this.label, required this.icon})
      : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20,),
          const SizedBox(height: 8,),
          Text(label, style: const TextStyle(fontSize: 11),),
        ],
      ),
    );
  }
}
