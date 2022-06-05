import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mas_banderas/models/country_model.dart';

class CountryProvider extends ChangeNotifier {
  //final String? search = 'colombia';
  CountryModel country = CountryModel(
    //default model
    name: 'Country name',
    languages: [Language(iso6392: 'No data', name: 'No data')],
    flag: 'flag',
    flags: Flags(
        png:
            'https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png',
        svg: ''),
    population: 0,
  );

  CountryProvider(String name) {
    this.displayCountry(name);
  }

  Future<Map<String, dynamic>> _getJsonData(String name) async {
    //get data from API
    final url =
        Uri.parse('https://restcountries.com/v2/name/' + name); //http parse
    final response = await http.get(url); //http request

    final map = Map.fromIterable(json.decode(response.body)
        as List); //response parsing List<dynamic> to Map<String, dynamic>
    final List<dynamic> keyList =
        map.keys.toList(); //parse map keys to list<dynamic>
    final responseMap = Map<String, dynamic>.from(
        keyList[0]); //parse keylist to map<String, dynamic>

    return (responseMap);
  }

  displayCountry(String name) async {
    try {
      //exception
      final jsonData = await _getJsonData(name);
      final response =
          CountryModel.fromJson(jsonData); //response maping in model
      displauCountryConsole(response); // print model data in debug console
      country = response;
      notifyListeners();
      return response;
    } catch (e) {
      final response = country;
      country = response;
      displauCountryConsole(response);
      notifyListeners();
      return response;
    }
  }

  displauCountryConsole(CountryModel country) {
    //print model data in debug console
    final nombre = country.name;
    final pop = country.population;
    final front = country.borders
        .toString()
        .replaceAll('[', '\n\t')
        .replaceAll(']', '')
        .replaceAll(',', '\n\t');
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
