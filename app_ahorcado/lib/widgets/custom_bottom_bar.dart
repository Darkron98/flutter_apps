import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 129, 192, 243),
      unselectedItemColor: Colors.blue,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.help,
            size: 40,
          ),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 40,
          ),
          label: 'Bar chart',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 40,
          ),
          label: 'Person',
        ),
      ],
    );
  }
}
