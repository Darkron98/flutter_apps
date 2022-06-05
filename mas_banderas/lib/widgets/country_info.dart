import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

import '../widgets/widgets.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../search/country_search_delegate.dart';

class CountryInfo extends StatelessWidget {
  final CountryModel country;
  final CountryProvider countryProvider;

  const CountryInfo(
      {Key? key, required this.country, required this.countryProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PageView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.05),
            _CountryAvatar(country: country),
            _CountryCard(size: size, country: country),
            SizedBox(height: size.height * 0.03),
            MaterialButton(
              height: size.height * 0.09,
              minWidth: size.width * 0.5,
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CountrySearchDelegate(
                      country: country,
                      countryProvider: countryProvider,
                    ));
              },
              elevation: 0,
              splashColor: Colors.transparent,
              child: const Icon(
                Icons.search,
                size: 40,
                color: Colors.white,
              ),
              shape: const StadiumBorder(),
              color: const Color.fromARGB(55, 255, 255, 255),
            ),
          ],
        ),
      ],
    );
  }
}

class _CountryCard extends StatelessWidget {
  final CountryModel country;
  const _CountryCard({
    Key? key,
    required this.size,
    required this.country,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(15),
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
    const color = Colors.white;
    return Table(
      children: [
        TableRow(
          children: [
            SingleCard(
              icon: Icons.person,
              color: color,
              label: 'Population',
              text: format.output.compactNonSymbol,
            ),
            SingleCard(
              icon: Icons.flag,
              color: color,
              label: 'Frontiers',
              text: country.borders == null
                  ? 'No data'
                  : country.borders
                      .toString()
                      .replaceAll('[', ' ')
                      .replaceAll(']', ' '),
            ),
          ],
        ),
        TableRow(
          children: [
            SingleCard(
              icon: Icons.swap_vert,
              color: color,
              label: 'Lat',
              text: country.latlng == null
                  ? 'no data'
                  : country.latlng![0].toString(),
            ),
            SingleCard(
              icon: Icons.swap_horiz,
              color: color,
              label: 'Lng',
              text: country.latlng == null
                  ? 'No data'
                  : country.latlng![1].toString(),
            ),
          ],
        ),
        TableRow(
          children: [
            SingleCard(
              icon: Icons.announcement,
              color: color,
              label: 'Language',
              text: country.languages[0].name.toString(),
            ),
            SingleCard(
              icon: Icons.attach_money,
              color: color,
              label: 'Currency',
              text: country.currencies == null
                  ? 'No data'
                  : country.currencies![0].name +
                      '\n' +
                      country.currencies![0].symbol +
                      ' ' +
                      country.currencies![0].code,
            ),
          ],
        ),
      ],
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
        const SizedBox(height: 5),
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
