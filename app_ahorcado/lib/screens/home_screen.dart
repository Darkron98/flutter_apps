import 'package:app_ahorcado/provider/bottom_provider.dart';
import 'package:app_ahorcado/screens/game_screen.dart';
import 'package:app_ahorcado/screens/screens.dart';
import 'package:app_ahorcado/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: PageTitle(),
      ),
      body: Center(
        child: _AppBody(),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

class _AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomProvider>(context);
    final index = provider.selectedMenuOpt;
    switch (index) {
      case 0:
        return ProfileScreen();
      case 1:
        return MainScreen();
      default:
        return ShopScreen();
    }
  }
}
