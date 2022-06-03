import 'package:flutter/material.dart';
import 'dart:ui';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _BackGround(),
          _CountryCard(),
        ],
      ),
    );
  }
}

class _CountryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PageView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            _CountryAvatar(),
            _CoutryCard(size: size),
          ],
        ),
      ],
    );
  }
}

class _CoutryCard extends StatelessWidget {
  const _CoutryCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: _CountryItems(),
          ),
        ),
      ),
    );
  }
}

class _CountryItems extends StatelessWidget {
  const _CountryItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.person,
              color: color,
              label: 'Population',
              text: '#',
            ),
            _SingleCard(
              icon: Icons.flag,
              color: color,
              label: 'Frontiers',
              text: 'text',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.gps_fixed,
              color: color,
              label: 'Latitud',
              text: '#',
            ),
            _SingleCard(
              icon: Icons.location_searching,
              color: color,
              label: 'Longitud',
              text: '#',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.announcement,
              color: color,
              label: 'Language',
              text: 'text',
            ),
            _SingleCard(
              icon: Icons.attach_money,
              color: color,
              label: 'Currency',
              text: '#',
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
  final String label;
  final String text;

  const _SingleCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.label,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Color.fromARGB(255, 155, 155, 155);
    return _CardBackGround(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 45,
            color: color,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              color: color,
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
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 130,
            decoration: BoxDecoration(
              color: Color.fromARGB(174, 208, 208, 209),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _CountryAvatar extends StatelessWidget {
  const _CountryAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
        ),
        SizedBox(height: 5),
        Text(
          'Country name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}

class _BackGround extends StatelessWidget {
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.2, 0.8],
      colors: [
        Color(0xff2C2645),
        Color(0xff202333),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
      ],
    );
  }
}
