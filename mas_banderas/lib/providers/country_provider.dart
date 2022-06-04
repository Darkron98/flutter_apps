import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mas_banderas/models/country_model.dart';

class CountryProvider extends ChangeNotifier {
  String _domain = 'restcountries.com';

  CountryProvider() {
    this.displayCountry();
  }

  Future<String> _getJsonData() async {
    final url = Uri.parse('https://restcountries.com/v3.1/name/colombia');
    final response = await http.get(url);
    final data = jsonDecode(response.body).toString();
    final data2 = json.decode(response.body);
    print(data2.runtimeType);
    return (response.body);
  }

  displayCountry() async {
    final jasonData = await _getJsonData();
    //final response = CountryModel.fromJson(jasonData);
    notifyListeners();
    //return response;
  }
}
