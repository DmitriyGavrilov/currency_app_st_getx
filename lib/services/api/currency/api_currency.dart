import 'package:currency_app_st_getx/models/main/currency_model.dart';
import 'package:currency_app_st_getx/services/api/api_client.dart';
import 'package:currency_app_st_getx/services/api/currency/dto/currency_response.dart';

/// Currency API endpoints
class ApiCurrency {
  final ApiClient client;

  ApiCurrency({required this.client});

  /// Currency list
  Future<List<Currency>> getCurrency({String? date}) async {
    dynamic response;
    if (date == null) {
      response = await client.get('/rates?periodicity=0');
    } else {
      response = await client.get('/rates?ondate=$date&periodicity=0');
    }
    final responseDto = CurrencyResponse.fromJson(response.data);
    List<Currency> currency = responseDto.currency.map((currencyItem) {
      return Currency(
        id: currencyItem.id,
        name: currencyItem.name,
        abbreviation: currencyItem.abbreviation,
        rate: currencyItem.rate,
        scale: currencyItem.scale,
        date: currencyItem.date,
      );
    }).toList();
    return currency;
  }
}
