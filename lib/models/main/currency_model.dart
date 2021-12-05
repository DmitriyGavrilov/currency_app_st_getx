import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Currency {
  late final Key key;
  late final int id;
  late final String name;
  late final String abbreviation;
  late final int scale;
  late final double rate;
  late final String date;
  double? tomorrowRate;
  double? yesterdayRate;
  RxBool active = true.obs;
  RxBool show = true.obs;

  Currency({
    required this.key,
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.scale,
    required this.rate,
    required this.date,
    this.tomorrowRate,
    this.yesterdayRate,
  });

  Currency.fromJson(Map<String, dynamic> json) {
    key = Key(json['Cur_ID'].toString());
    id = json['Cur_ID'];
    name = json['Cur_Name'];
    abbreviation = json['Cur_Abbreviation'];
    scale = json['Cur_Scale'];
    rate = json['Cur_OfficialRate'];
    date = json['Date'];
  }
}
