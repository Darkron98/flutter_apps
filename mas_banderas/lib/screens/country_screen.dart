import 'package:flutter/material.dart';
import 'package:mas_banderas/models/country_model.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:mas_banderas/providers/country_provider.dart';
import 'package:money_formatter/money_formatter.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          _BackGround(),
          _CountryCard(
            country: countryProvider.country!,
          ),
        ],
      ),
    );
  }
}

class _CountryCard extends StatelessWidget {
  final CountryModel country;

  const _CountryCard({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PageView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            _CountryAvatar(country: country),
            _CoutryCard(size: size, country: country),
          ],
        ),
      ],
    );
  }
}

class _CoutryCard extends StatelessWidget {
  final CountryModel country;
  const _CoutryCard({
    Key? key,
    required this.size,
    required this.country,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(15),
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
            child: _CountryItems(country: country),
          ),
        ),
      ),
    );
  }
}

class _CountryItems extends StatelessWidget {
  final CountryModel country;
  const _CountryItems({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MoneyFormatter format =
        MoneyFormatter(amount: country.population.toDouble());
    final color = Colors.white;
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.person,
              color: color,
              label: 'Population',
              text: format.output.compactNonSymbol,
            ),
            _SingleCard(
              icon: Icons.flag,
              color: color,
              label: 'Frontiers',
              text: country.borders == null
                  ? 'Irrelevant'
                  : country.borders
                      .toString()
                      .replaceAll('[', ' ')
                      .replaceAll(']', ' '),
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.swap_vert,
              color: color,
              label: 'Lat',
              text: country.latlng == null
                  ? 'Irrelevant'
                  : country.latlng![0].toString(),
            ),
            _SingleCard(
              icon: Icons.swap_horiz,
              color: color,
              label: 'Lng',
              text: country.latlng == null
                  ? 'Irrelevant'
                  : country.latlng![1].toString(),
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.announcement,
              color: color,
              label: 'Language',
              text: country.languages[0].name.toString(),
            ),
            _SingleCard(
              icon: Icons.attach_money,
              color: color,
              label: 'Currency',
              text: country.currencies == null
                  ? 'Irrelevant'
                  : country.currencies![0].name +
                      ' : ' +
                      country.currencies![0].symbol,
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
    final size = MediaQuery.of(context).size;
    final color = Color.fromARGB(255, 155, 155, 155);
    return _CardBackGround(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: size.width * 0.115,
            color: color,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: size.width * 0.04,
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
              fontSize: size.width * 0.03,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
  final CountryModel country;
  const _CountryAvatar({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(country.flags.png),
          radius: size.width * 0.135,
        ),
        SizedBox(height: 5),
        Text(
          country.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: size.width * 0.065,
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
