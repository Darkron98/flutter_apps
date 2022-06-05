import 'dart:ui';

import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  //singel card implements the country item styles <item icon, item name, item info>
  final IconData icon;
  final Color color;
  final String label;
  final String text;

  const SingleCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.label,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const color = Color.fromARGB(255, 155, 155, 155);
    return _CardBackGround(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            //item icon
            icon,
            size: size.width * 0.115,
            color: color,
          ),
          const SizedBox(height: 5),
          Text(
            //item name
            label,
            style: TextStyle(
              color: color,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            //item info
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: size.width * 0.03,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _CardBackGround extends StatelessWidget {
  //info card background styles
  final Widget child;

  const _CardBackGround({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(size.height * 0.0125),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: size.height * 0.162,
            decoration: BoxDecoration(
              color: const Color.fromARGB(174, 208, 208, 209),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
