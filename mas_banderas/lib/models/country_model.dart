// To parse this JSON data, do
//
//     final countryModel = countryModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class CountryModel {
  CountryModel({
    required this.name,
    required this.topLevelDomain,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.callingCodes,
    required this.capital,
    required this.altSpellings,
    required this.subregion,
    required this.region,
    required this.population,
    required this.latlng,
    required this.demonym,
    required this.area,
    required this.gini,
    required this.timezones,
    required this.borders,
    required this.nativeName,
    required this.numericCode,
    required this.flags,
    required this.currencies,
    required this.languages,
    required this.translations,
    required this.flag,
    required this.regionalBlocs,
    required this.cioc,
    required this.independent,
  });

  String name;
  List<String> topLevelDomain;
  String alpha2Code;
  String alpha3Code;
  List<String> callingCodes;
  String capital;
  List<String> altSpellings;
  String subregion;
  String region;
  int population;
  List<int> latlng;
  String demonym;
  int area;
  double gini;
  List<String> timezones;
  List<String> borders;
  String nativeName;
  String numericCode;
  Flags flags;
  List<Currency> currencies;
  List<Language> languages;
  Translations translations;
  String flag;
  List<RegionalBloc> regionalBlocs;
  String cioc;
  bool independent;

  factory CountryModel.fromJson(String str) =>
      CountryModel.fromMap(json.decode(str));

  factory CountryModel.fromMap(Map<String, dynamic> json) => CountryModel(
        name: json["name"],
        topLevelDomain: List<String>.from(json["topLevelDomain"].map((x) => x)),
        alpha2Code: json["alpha2Code"],
        alpha3Code: json["alpha3Code"],
        callingCodes: List<String>.from(json["callingCodes"].map((x) => x)),
        capital: json["capital"],
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        subregion: json["subregion"],
        region: json["region"],
        population: json["population"],
        latlng: List<int>.from(json["latlng"].map((x) => x)),
        demonym: json["demonym"],
        area: json["area"],
        gini: json["gini"].toDouble(),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        borders: List<String>.from(json["borders"].map((x) => x)),
        nativeName: json["nativeName"],
        numericCode: json["numericCode"],
        flags: Flags.fromMap(json["flags"]),
        currencies: List<Currency>.from(
            json["currencies"].map((x) => Currency.fromMap(x))),
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromMap(x))),
        translations: Translations.fromMap(json["translations"]),
        flag: json["flag"],
        regionalBlocs: List<RegionalBloc>.from(
            json["regionalBlocs"].map((x) => RegionalBloc.fromMap(x))),
        cioc: json["cioc"],
        independent: json["independent"],
      );
}

class Currency {
  Currency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  String code;
  String name;
  String symbol;

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
      );
}

class Flags {
  Flags({
    required this.svg,
    required this.png,
  });

  String svg;
  String png;

  factory Flags.fromJson(String str) => Flags.fromMap(json.decode(str));

  factory Flags.fromMap(Map<String, dynamic> json) => Flags(
        svg: json["svg"],
        png: json["png"],
      );
}

class Language {
  Language({
    required this.iso6391,
    required this.iso6392,
    required this.name,
    required this.nativeName,
  });

  String iso6391;
  String iso6392;
  String name;
  String nativeName;

  factory Language.fromJson(String str) => Language.fromMap(json.decode(str));

  factory Language.fromMap(Map<String, dynamic> json) => Language(
        iso6391: json["iso639_1"],
        iso6392: json["iso639_2"],
        name: json["name"],
        nativeName: json["nativeName"],
      );
}

class RegionalBloc {
  RegionalBloc({
    required this.acronym,
    required this.name,
    required this.otherNames,
    this.otherAcronyms,
  });

  String acronym;
  String name;
  List<String> otherNames;
  List<String>? otherAcronyms;

  factory RegionalBloc.fromJson(String str) =>
      RegionalBloc.fromMap(json.decode(str));

  factory RegionalBloc.fromMap(Map<String, dynamic> json) => RegionalBloc(
        acronym: json["acronym"],
        name: json["name"],
        otherNames: List<String>.from(json["otherNames"].map((x) => x)),
        otherAcronyms: json["otherAcronyms"] == null
            ? null
            : List<String>.from(json["otherAcronyms"].map((x) => x)),
      );
}

class Translations {
  Translations({
    required this.br,
    required this.pt,
    required this.nl,
    required this.hr,
    required this.fa,
    required this.de,
    required this.es,
    required this.fr,
    required this.ja,
    required this.it,
    required this.hu,
  });

  String br;
  String pt;
  String nl;
  String hr;
  String fa;
  String de;
  String es;
  String fr;
  String ja;
  String it;
  String hu;

  factory Translations.fromJson(String str) =>
      Translations.fromMap(json.decode(str));

  factory Translations.fromMap(Map<String, dynamic> json) => Translations(
        br: json["br"],
        pt: json["pt"],
        nl: json["nl"],
        hr: json["hr"],
        fa: json["fa"],
        de: json["de"],
        es: json["es"],
        fr: json["fr"],
        ja: json["ja"],
        it: json["it"],
        hu: json["hu"],
      );
}
