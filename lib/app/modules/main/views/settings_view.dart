import 'package:currency_app_st_getx/app/modules/main/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Settings screen
class SettingsView extends GetView<MainController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints constraints,
            ) =>
                Container(),
          ),
        ),
      ),
    );
  }
}
