import 'package:currency_app_st_getx/services/api/currency/api_currency.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_client.dart';

/// Access to Api endpoints
class ApiService extends GetxService {
  late final ApiClient _client;
  late final ApiCurrency _currency;

  ApiService() {
    final dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    _client = ApiClient(dio: dio);
    _currency = ApiCurrency(client: _client);
  }

  /// Reinit API client
  void reInitClient() {
    _client.init();
  }

  ApiCurrency getCurrencyClient() => _currency;
}
