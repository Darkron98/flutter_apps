import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mas_banderas/models/country_model.dart';

class CountryProvider extends ChangeNotifier {
  String _country = 'colombia';
  String _domain = 'restcountries.com';
  CountryModel? country;

  MovieProvider() {
    this.displayCountry();
  }

  displayCountry() async {
    final url = Uri.https(_domain, 'v3.1/name/$_country');
    final response = await http.get(url);
    country = CountryModel.fromJson(response.body);
    print('1');
    notifyListeners();
  }
}
