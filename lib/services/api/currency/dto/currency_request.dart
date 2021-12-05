class CurrencyRequest {
  CurrencyRequest({
    required this.onDate,
    required this.periodICity,
  });

  final String onDate;

  final String periodICity;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ondate'] = onDate;
    data['periodicity'] = periodICity;
    return data;
  }
}
