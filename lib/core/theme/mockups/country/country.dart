// Use third party provider for these data

import 'package:pine_app/core/theme/mockups/country/country_json.dart';

var countryData = CountryData.fromJson(countryJson);

class CountryData {
  String? status;
  int? statusCode;
  String? version;
  String? access;
  List<CountryModel> countries = [];

  CountryData(
      {this.status,
      this.statusCode,
      this.version,
      this.access,
      this.countries = const []});

  CountryData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status-code'];
    version = json['version'];
    access = json['access'];
    if (json['data'] is Map<String, dynamic>) {
      final map = json['data'] as Map<String, dynamic>;
      map.entries.forEach((element) {
        countries.add(CountryModel.fromMapEntry(element));
      });
    }
  }
}

class CountryModel {
  String? code;
  String? name;
  String? region;

  CountryModel({this.code, this.name, this.region});

  CountryModel.fromMapEntry(MapEntry<String, dynamic> entry) {
    code = entry.key;
    name = entry.value['country'];
    region = entry.value['region'];
  }
}
