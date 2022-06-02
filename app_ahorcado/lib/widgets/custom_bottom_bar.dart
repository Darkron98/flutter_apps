import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/providers.dart';

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomProvider>(context);
    final index = provider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int i) => provider.selectedMenuOpt = i,
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 129, 192, 243),
      unselectedItemColor: Colors.blue,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
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
            Icons.local_grocery_store,
            size: 40,
          ),
          label: 'Person',
        ),
      ],
    );
  }
}
