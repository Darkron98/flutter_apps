import '../screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'shop': (_) => ShopScreen(),
        'game': (_) => GameScreen(),
        'profile': (_) => ProfileScreen(),
      },
    );
  }
}
