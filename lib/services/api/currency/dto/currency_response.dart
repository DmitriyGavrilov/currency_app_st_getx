import 'package:flutter/material.dart';

class CurrencyResponse {
  List<CurrencyResponseItem> currency = [];

  CurrencyResponse(this.currency);

  CurrencyResponse.fromJson(List<dynamic> json) {
    for (var currencyItem in json) {
      currency.add(CurrencyResponseItem.fromJson(currencyItem));
    }
  }
}

class CurrencyResponseItem {
  late Key key;
  late int id;
  late String name;
  late String abbreviation;
  late int scale;
  late double rate;
  late String date;

  CurrencyResponseItem({
    required this.key,
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.scale,
    required this.rate,
    required this.date,
  });

  CurrencyResponseItem.fromJson(Map<String, dynamic> json) {
    key = Key(json['Cur_ID'].toString());
    id = json['Cur_ID'];
    name = json['Cur_Name'];
    abbreviation = json['Cur_Abbreviation'];
    scale = json['Cur_Scale'];
    rate = json['Cur_OfficialRate'];
    date = json['Date'];
  }
}
