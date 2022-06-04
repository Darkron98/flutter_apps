import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mas_banderas/providers/country_provider.dart';
import 'package:provider/provider.dart';
import '../screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountryProvider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '+Flags',
      initialRoute: 'title_screen',
      routes: {
        'title_screen': (_) => MainScreen(),
        'main_screen': (_) => CountryScreen(),
      },
    );
  }
}
