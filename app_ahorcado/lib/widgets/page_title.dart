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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: 30,
                  height: 30,
                  image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/254/254232.png'),
                ),
                Text(
                  'number',
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
                Image(
                  width: 30,
                  height: 30,
                  image: NetworkImage(
                      'https://clipart.world/wp-content/uploads/2020/08/heart-png-transparent.png'),
                ),
                Text(
                  'number',
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
