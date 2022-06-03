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
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: size.height * 0.562,
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
              text: 'Population',
            ),
            _SingleCard(
              icon: Icons.flag,
              color: color,
              text: 'Frontiers',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.gps_fixed,
              color: color,
              text: 'Latitud',
            ),
            _SingleCard(
              icon: Icons.location_searching,
              color: color,
              text: 'Longitud',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.announcement,
              color: color,
              text: 'Language',
            ),
            _SingleCard(
              icon: Icons.attach_money,
              color: color,
              text: 'Currency',
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
          Icon(
            icon,
            size: 45,
            color: Colors.white,
          ),
          SizedBox(height: 5),
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
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 130,
            decoration: BoxDecoration(
              color: Color.fromARGB(175, 133, 135, 138),
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
