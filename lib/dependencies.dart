import 'package:currency_app_st_getx/services/api/api_service.dart';
import 'package:currency_app_st_getx/services/common/storage/storage_service.dart';
import 'package:get/get.dart';

/// Global dependencies, services.
class Dependencies {
  /// Inject dependencies before run app
  static Future<void> inject() async {
    // 1. Storage service
    final StorageService storage = StorageService();
    await storage.init();
    Get.put<StorageService>(storage);
  }

  /// Inject dependencies on app start
  static Future<void> loadOnAppStart() async {
    // 2. API service
    Get.put(ApiService());
  }
}
