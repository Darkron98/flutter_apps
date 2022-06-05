import 'package:flutter/material.dart';

import '../models/models.dart';
import '../providers/providers.dart';

class CountrySearchDelegate extends SearchDelegate {
  final CountryModel? country;
  final CountryProvider? countryProvider;

  CountrySearchDelegate({this.country, this.countryProvider});
  @override
  List<Widget>? buildActions(BuildContext context) {
    //implement clear delegate
    return [
      IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //implement to back screen icon
    return IconButton(
      icon: const Icon(Icons.arrow_left),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //return search items
    final countryProv = CountryProvider(query);
    if (query.trim().isEmpty) {
      return const Text('Not query value');
    }
    return FutureBuilder(
      //future implements
      future: countryProv.displayCountry(query),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return _showCountries(context, snapshot.data);
        } else {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 4),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //suggestion: search a country by name
    return const ListTile(
      title: Center(
        child: Text(
          'Search a country by name',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _showCountries(BuildContext context, CountryModel countries) {
    //search item list view
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (_, i) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(countries.flags.png),
          ),
          title: Text(countries.name),
          subtitle: Text(countries.languages[0].name),
          trailing: Text(countries.currencies == null
              ? '---'
              : countries.currencies![0].code +
                  ' : ' +
                  countries.currencies![0].symbol),
          onTap: () {
            countryProvider!.country = countries;
            countryProvider!.notifyListeners();
            close(context, null);
          },
        );
      },
    );
  }
}
