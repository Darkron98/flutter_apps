import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mas_banderas/models/country_model.dart';

class CountryProvider extends ChangeNotifier {
  String? search = 'colombia';
  CountryModel? country;

  CountryProvider({search}) {
    this.displayCountry();
  }

  Future<Map<String, dynamic>> _getJsonData() async {
    final url = Uri.parse(
        'https://restcountries.com/v2/name/' + search!); //http request
    final response = await http.get(url);

    final map = Map.fromIterable(json.decode(response.body)
        as List); //response parsing List<dynamic> -> Map<String, dynamic>
    final List<dynamic> keyList = map.keys.toList();
    final responseMap = Map<String, dynamic>.from(keyList[0]);

    return (responseMap);
  }

  displayCountry() async {
    final jsonData = await _getJsonData();
    final response = CountryModel.fromJson(jsonData); //response maping in model

    country = response;
    displauCountryConsole(response);
    notifyListeners();
  }

  displauCountryConsole(CountryModel country) {
    final nombre = country.name;
    final pop = country.population;
    final front = country.borders.toString();
    final lang = country.languages[0].name;
    final lat = country.latlng == null ? '--' : country.latlng![0];
    final lng = country.latlng == null ? '--' : country.latlng![1];
    final currency = country.currencies == null
        ? '--'
        : country.currencies![0].name + ' : ' + country.currencies![0].symbol;
    final flag = country.flags.png;
    print('''===========================
    Pais: $nombre
    Población: $pop
    Fronteras: $front
    languages: $lang
    Latitud : $lat
    Longitud: $lng
    Moneda: $currency
    Bandera: $flag
    ===========================''');
  }
}
