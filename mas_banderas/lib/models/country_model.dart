import 'dart:convert';

class CountryModel {
  CountryModel({
    required this.name,
    this.currencies,
    required this.languages,
    this.translations,
    this.latlng,
    this.borders,
    required this.flag,
    required this.flags,
    required this.population,
  });

  String name;
  List<Currency>? currencies;
  List<Language> languages;
  Translations? translations;
  List<double>? latlng;
  List<String>? borders;
  String flag;
  int population;
  Flags flags;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      CountryModel.fromMap(json);

  factory CountryModel.fromMap(Map<String, dynamic> json) => CountryModel(
        name: json["name"],
        currencies: json["currencies"] == null
            ? null
            : List<Currency>.from(
                json["currencies"].map((x) => Currency.fromMap(x))),
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromMap(x))),
        translations: json["translations"] == null
            ? null
            : Translations.fromMap(json["translations"]),
        latlng: json["latlng"] == null
            ? null
            : List<double>.from(json["latlng"].map((x) => x.toDouble())),
        borders: json["borders"] == null
            ? null
            : List<String>.from(json["borders"].map((x) => x)),
        flag: json["flag"],
        population: json["population"],
        flags: Flags.fromMap(json["flags"]),
      );
}

class Flags {
  Flags({
    required this.png,
    required this.svg,
  });

  String png;
  String svg;

  factory Flags.fromJson(String str) => Flags.fromMap(json.decode(str));

  factory Flags.fromMap(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
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

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
      );
}

class Language {
  Language({
    this.iso6391,
    required this.iso6392,
    required this.name,
    this.nativeName,
  });

  String? iso6391;
  String iso6392;
  String name;
  String? nativeName;

  factory Language.fromMap(Map<String, dynamic> json) => Language(
        iso6391: json["iso639_1"] == null ? null : json["iso639_1"],
        iso6392: json["iso639_2"],
        name: json["name"],
        nativeName: json["nativeName"] == null ? null : json["nativeName"],
      );
}

class Translations {
  Translations({
    required this.br,
    required this.pt,
    required this.nl,
    required this.hr,
    this.fa,
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
  String? fa;
  String de;
  String es;
  String fr;
  String ja;
  String it;
  String hu;

  factory Translations.fromMap(Map<String, dynamic> json) => Translations(
        br: json["br"],
        pt: json["pt"],
        nl: json["nl"],
        hr: json["hr"],
        fa: json["fa"] == null ? null : json["fa"],
        de: json["de"],
        es: json["es"],
        fr: json["fr"],
        ja: json["ja"],
        it: json["it"],
        hu: json["hu"],
      );
}
