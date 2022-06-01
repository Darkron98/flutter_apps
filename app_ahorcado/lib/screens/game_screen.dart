import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: NetworkImage(
              'https://media.istockphoto.com/vectors/gallows-with-rope-and-noose-execution-death-and-justice-symbol-vector-vector-id1220586656?k=20&m=1220586656&s=612x612&w=0&h=3g6KMLtZT4yRl2gWyznJXCMjxjBZ7VuupSvm-cGuOi0='),
        ),
      ),
    );
  }
}
