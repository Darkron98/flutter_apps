import 'dart:ui';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.image,
              color: Colors.blue,
              text: '500',
            ),
            _SingleCard(
              icon: Icons.image,
              color: Colors.blue,
              text: '500',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.image,
              color: Colors.blue,
              text: '500',
            ),
            _SingleCard(
              icon: Icons.image,
              color: Colors.blue,
              text: '500',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.image,
              color: Colors.blue,
              text: '500',
            ),
            _SingleCard(
              icon: Icons.image,
              color: Colors.blue,
              text: '500',
            ),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _CardBackGround(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardBackGround extends StatelessWidget {
  final Widget child;

  const _CardBackGround({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 129, 192, 243),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
