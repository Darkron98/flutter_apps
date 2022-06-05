import 'package:flutter/material.dart';
import 'package:mas_banderas/models/country_model.dart';
import 'package:mas_banderas/providers/country_provider.dart';

class CountrySearchDelegate extends SearchDelegate {
  final CountryModel? country;
  final CountryProvider? countryProvider;

  CountrySearchDelegate({this.country, this.countryProvider}) {}
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => this.query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_left),
      onPressed: () => this.close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final countryProv = new CountryProvider(query);
    if (query.trim().length == 0) {
      return Text('Not query value');
    }
    return FutureBuilder(
      future: countryProv.displayCountry(query),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return _showCountries(context, snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(strokeWidth: 4),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(
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
            this.close(context, null);
          },
        );
      },
    );
  }
}
