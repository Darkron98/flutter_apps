import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //country screen
    final countryProvider = Provider.of<CountryProvider>(context);
    return CountryInfo(
      countryProvider: countryProvider,
      country: countryProvider.country,
    );
  }
}
