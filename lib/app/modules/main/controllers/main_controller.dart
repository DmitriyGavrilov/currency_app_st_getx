import 'dart:async';

import 'package:currency_app_st_getx/models/main/currency_model.dart';
import 'package:currency_app_st_getx/services/api/api_service.dart';
import 'package:currency_app_st_getx/services/api/currency/api_currency.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  late ApiCurrency _apiCurrency;

  // Controller data
  List<Currency> _yesterdayCurrency = [];
  List<Currency> get yesterdayCurrency => [..._yesterdayCurrency];
  List<Currency> _currency = [];
  List<Currency> get currency => [..._currency];
  List<Currency> _tomorrowCurrency = [];
  List<Currency> get tomorrowCurrency => [..._tomorrowCurrency];

  // Controller wide observables
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;

  /// Get yesterday date
  String getYesterdayDate() {
    final today = DateTime.now();
    return DateFormat('yyyy-MM-dd')
        .format(DateTime(today.year, today.month, today.day - 1));
  }

  /// Get date
  String getDate() {
    final today = DateTime.now();
    return DateFormat('yyyy-MM-dd')
        .format(DateTime(today.year, today.month, today.day));
  }

  /// Get tommorow date
  String getTomorrowDate() {
    final today = DateTime.now();
    return DateFormat('yyyy-MM-dd')
        .format(DateTime(today.year, today.month, today.day + 1));
  }

  /// Get yesterday date
  String getYesterdayDateText() {
    final today = DateTime.now();
    return DateFormat('MM.dd.yy')
        .format(DateTime(today.year, today.month, today.day - 1));
  }

  /// Get date
  String getDateText() {
    final today = DateTime.now();
    return DateFormat('MM.dd.yy')
        .format(DateTime(today.year, today.month, today.day));
  }

  /// Get tommorow date
  String getTomorrowDateText() {
    final today = DateTime.now();
    return DateFormat('MM.dd.yy')
        .format(DateTime(today.year, today.month, today.day + 1));
  }

  @override
  void onInit() {
    _apiCurrency = Get.find<ApiService>().getCurrencyClient();
    initController().then((_) => super.onInit());
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> initController() async {
    try {
      _currency = await _apiCurrency.getCurrency();

      _tomorrowCurrency = await _apiCurrency.getCurrency(
        date: getTomorrowDate(),
      );

      if (tomorrowCurrency.isEmpty) {
        _yesterdayCurrency = await _apiCurrency.getCurrency(
          date: getYesterdayDate(),
        );
        for (var yesterdayItem in _yesterdayCurrency) {
          for (var todayItem in _currency) {
            if (yesterdayItem.id == todayItem.id) {
              todayItem.yesterdayRate = yesterdayItem.rate;
            }
          }
        }
      } else {
        for (var tomorrowItem in _tomorrowCurrency) {
          for (var todayItem in _currency) {
            if (tomorrowItem.id == todayItem.id) {
              todayItem.tomorrowRate = tomorrowItem.rate;
            }
          }
        }
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      isError.value = true;
    }
  }
}
