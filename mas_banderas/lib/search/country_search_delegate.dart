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
      return const Center(
        child: Text(
          'Search a country by name',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      );
    }
    return FutureBuilder(
      //future implements
      future: countryProv.searchDelegateResp(query),
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

  Widget _showCountries(BuildContext context, List<CountryModel> countries) {
    //search item list view
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (_, i) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(countries[i].flags.png),
          ),
          title: Text(countries[i].name),
          subtitle: Text(countries[i].languages[0].name),
          trailing: Text(countries[i].currencies == null
              ? '---'
              : countries[i].currencies![0].code +
                  ' : ' +
                  countries[i].currencies![0].symbol),
          onTap: () {
            countryProvider!.country = countries[i];
            countryProvider!.notifyListeners();
            close(context, null);
          },
        );
      },
    );
  }
}
