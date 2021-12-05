part of 'app_pages.dart';

/// [Routes] are used in route changing calls, like [Get.toNamed] for example
abstract class Routes {
  Routes._();

  // Main module - App initialization, Main, Settings
  static const main = _Paths.main;
  static const settings = _Paths.settings;
}

/// [_Paths] are used internally in [AppPages] by GetX router.
/// It's values will be shown as links in web applications.
abstract class _Paths {
  static const main = '/';
  static const settings = '/settings';
}
