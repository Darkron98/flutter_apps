// To parse this JSON data, do
//
//     final countryModel = countryModelFromMap(jsonString);

import 'dart:ffi';

import 'package:meta/meta.dart';
import 'dart:convert';

class CountryModel {
  CountryModel({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
  });

  Name name;
  List<String> tld;
  String cca2;
  String ccn3;
  String cca3;
  String cioc;
  bool independent;
  String status;
  bool unMember;
  Currencies currencies;
  Idd idd;
  List<String> capital;
  List<String> altSpellings;
  String region;
  String subregion;
  Languages languages;
  Map<String, Translation> translations;
  List<double> latlng;
  bool landlocked;
  List<String> borders;
  double area;
  Demonyms demonyms;
  String flag;
  Maps maps;
  int population;
  Gini gini;
  String fifa;
  Car car;
  List<String> timezones;
  List<String> continents;
  CoatOfArms flags;
  CoatOfArms coatOfArms;
  String startOfWeek;
  CapitalInfo capitalInfo;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      CountryModel.fromMap(json);

  factory CountryModel.fromMap(Map<String, dynamic> json) => CountryModel(
        name: Name.fromMap(json["name"]),
        tld: List<String>.from(json["tld"].map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        independent: json["independent"],
        status: json["status"],
        unMember: json["unMember"],
        currencies: Currencies.fromMap(json["currencies"]),
        idd: Idd.fromMap(json["idd"]),
        capital: List<String>.from(json["capital"].map((x) => x)),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: json["region"],
        subregion: json["subregion"],
        languages: Languages.fromMap(json["languages"]),
        translations: Map.from(json["translations"]).map(
            (k, v) => MapEntry<String, Translation>(k, Translation.fromMap(v))),
        latlng: List<double>.from(json["latlng"].map((x) => x)),
        landlocked: json["landlocked"],
        borders: List<String>.from(json["borders"].map((x) => x)),
        area: json["area"],
        demonyms: Demonyms.fromMap(json["demonyms"]),
        flag: json["flag"],
        maps: Maps.fromMap(json["maps"]),
        population: json["population"],
        gini: Gini.fromMap(json["gini"]),
        fifa: json["fifa"],
        car: Car.fromMap(json["car"]),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<String>.from(json["continents"].map((x) => x)),
        flags: CoatOfArms.fromMap(json["flags"]),
        coatOfArms: CoatOfArms.fromMap(json["coatOfArms"]),
        startOfWeek: json["startOfWeek"],
        capitalInfo: CapitalInfo.fromMap(json["capitalInfo"]),
      );
}

class CapitalInfo {
  CapitalInfo({
    required this.latlng,
  });

  List<double> latlng;

  factory CapitalInfo.fromJson(String str) =>
      CapitalInfo.fromMap(json.decode(str));

  factory CapitalInfo.fromMap(Map<String, dynamic> json) => CapitalInfo(
        latlng: List<double>.from(json["latlng"].map((x) => x.toDouble())),
      );
}

class Car {
  Car({
    required this.signs,
    required this.side,
  });

  List<String> signs;
  String side;

  factory Car.fromJson(String str) => Car.fromMap(json.decode(str));

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        signs: List<String>.from(json["signs"].map((x) => x)),
        side: json["side"],
      );
}

class CoatOfArms {
  CoatOfArms({
    required this.png,
    required this.svg,
  });

  String png;
  String svg;

  factory CoatOfArms.fromJson(String str) =>
      CoatOfArms.fromMap(json.decode(str));

  factory CoatOfArms.fromMap(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );
}

class Currencies {
  Currencies({
    required this.cop,
  });

  Cop cop;

  factory Currencies.fromJson(String str) =>
      Currencies.fromMap(json.decode(str));

  factory Currencies.fromMap(Map<String, dynamic> json) => Currencies(
        cop: Cop.fromMap(json["COP"]),
      );
}

class Cop {
  Cop({
    required this.name,
    required this.symbol,
  });

  String name;
  String symbol;

  factory Cop.fromJson(String str) => Cop.fromMap(json.decode(str));

  factory Cop.fromMap(Map<String, dynamic> json) => Cop(
        name: json["name"],
        symbol: json["symbol"],
      );
}

class Demonyms {
  Demonyms({
    required this.eng,
    required this.fra,
  });

  Eng eng;
  Eng fra;

  factory Demonyms.fromJson(String str) => Demonyms.fromMap(json.decode(str));

  factory Demonyms.fromMap(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromMap(json["eng"]),
        fra: Eng.fromMap(json["fra"]),
      );
}

class Eng {
  Eng({
    required this.f,
    required this.m,
  });

  String f;
  String m;

  factory Eng.fromJson(String str) => Eng.fromMap(json.decode(str));

  factory Eng.fromMap(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );
}

class Gini {
  Gini({
    required this.the2019,
  });

  double the2019;

  factory Gini.fromJson(String str) => Gini.fromMap(json.decode(str));

  factory Gini.fromMap(Map<String, dynamic> json) => Gini(
        the2019: json["2019"].toDouble(),
      );
}

class Idd {
  Idd({
    required this.root,
    required this.suffixes,
  });

  String root;
  List<String> suffixes;

  factory Idd.fromJson(String str) => Idd.fromMap(json.decode(str));

  factory Idd.fromMap(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: List<String>.from(json["suffixes"].map((x) => x)),
      );
}

class Languages {
  Languages({
    required this.spa,
  });

  String spa;

  factory Languages.fromJson(String str) => Languages.fromMap(json.decode(str));

  factory Languages.fromMap(Map<String, dynamic> json) => Languages(
        spa: json["spa"],
      );
}

class Maps {
  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  String googleMaps;
  String openStreetMaps;

  factory Maps.fromJson(String str) => Maps.fromMap(json.decode(str));

  factory Maps.fromMap(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );
}

class Name {
  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  String common;
  String official;
  NativeName nativeName;

  factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: NativeName.fromMap(json["nativeName"]),
      );
}

class NativeName {
  NativeName({
    required this.spa,
  });

  Translation spa;

  factory NativeName.fromJson(String str) =>
      NativeName.fromMap(json.decode(str));

  factory NativeName.fromMap(Map<String, dynamic> json) => NativeName(
        spa: Translation.fromMap(json["spa"]),
      );
}

class Translation {
  Translation({
    required this.official,
    required this.common,
  });

  String official;
  String common;

  factory Translation.fromJson(String str) =>
      Translation.fromMap(json.decode(str));

  factory Translation.fromMap(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );
}
