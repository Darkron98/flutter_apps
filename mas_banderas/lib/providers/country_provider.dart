import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mas_banderas/models/country_model.dart';

class CountryProvider extends ChangeNotifier {
  String _domain = 'restcountries.com';
  CountryModel? country;

  CountryProvider() {
    this.displayCountry();
  }

  Future<Map<String, dynamic>> _getJsonData() async {
    final url = Uri.parse('https://restcountries.com/v3.1/name/colombia');
    final response = await http.get(url);
    final map = Map.fromIterable(json.decode(response.body) as List);
    final List<dynamic> keyList = map.keys.toList();
    final responseMap = Map<String, dynamic>.from(keyList[0]);

    print('keys: ' + responseMap.keys.toList().toString());
    return (responseMap);
  }

  displayCountry() async {
    final jsonData = await _getJsonData();
    final response = CountryModel.fromJson(jsonData);
    country = response;
    notifyListeners();
  }
}
