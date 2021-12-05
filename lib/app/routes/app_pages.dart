import 'package:currency_app_st_getx/app/modules/main/bindings/main_bindings.dart';
import 'package:currency_app_st_getx/app/modules/main/views/main_view.dart';
import 'package:currency_app_st_getx/app/modules/main/views/settings_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

/// GetX router data
class AppPages {
  AppPages._();

  static const initial = Routes.main;

  static final routes = [
    GetPage(
      title: 'Main',
      name: _Paths.main,
      page: () => const MainView(),
      binding: MainBindings(),
    ),
    GetPage(
      title: 'Settings',
      name: _Paths.settings,
      page: () => const SettingsView(),
      binding: MainBindings(),
    ),
  ];
}
