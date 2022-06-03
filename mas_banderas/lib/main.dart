import 'package:flutter/material.dart';
import 'package:mas_banderas/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'title_screen',
        routes: {
          'title_screen': (_) => TitleScreen(),
        });
  }
}
