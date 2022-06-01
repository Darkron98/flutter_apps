import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(
                  Icons.diamond,
                  color: Colors.blue,
                ),
                Text(
                  'premium',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const Text(
              'time',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Text(
                  '# of lifes',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
