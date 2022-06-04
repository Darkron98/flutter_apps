import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'title_screen',
      routes: {
        'title_screen': (_) => MainScreen(),
        'main_screen': (_) => CountryScreen(),
      },
    );
  }
}
