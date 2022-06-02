import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Color.fromARGB(255, 129, 192, 243);
    return Column(
      children: [
        SizedBox(height: 120),
        Text(
          'Puntuación',
          style: TextStyle(
            fontSize: 40,
            color: Colors.blue,
          ),
        ),
        Text(
          '000000000',
          style: TextStyle(
            color: color,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 100),
        FloatingActionButton.large(
          backgroundColor: color,
          onPressed: () => Navigator.pushNamed(context, 'game'),
          child: Icon(
            Icons.play_arrow,
            size: 50,
          ),
        ),
        SizedBox(height: 100),
        Column(
          children: [
            Text(
              'Nivel',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                  size: 40,
                ),
                Icon(
                  Icons.image,
                  color: color,
                  size: 50,
                ),
                Icon(
                  Icons.image,
                  color: color,
                  size: 50,
                ),
                Icon(
                  Icons.image,
                  color: color,
                  size: 50,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 40,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
