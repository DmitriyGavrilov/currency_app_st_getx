import 'package:currency_app_st_getx/app/modules/main/controllers/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Settings screen
class SettingsView extends GetView<MainController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Настройка валют',
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: controller.backToMain,
          splashRadius: 20.0,
        ),
        actions: [
          Obx(
            () => controller.settingsChanged.value
                ? IconButton(
                    icon: const Icon(
                      Icons.check,
                    ),
                    iconSize: 30.0,
                    onPressed: controller.saveSettings,
                    splashRadius: 20.0,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints constraints,
          ) =>
              Obx(
            () => ReorderableListView.builder(
              itemCount: controller.currency.length,
              onReorder: controller.updatePosition,
              itemBuilder: (ctx, index) => Row(
                key: controller.newSettingsCurrency[index].key,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onLongPress: () {},
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(
                                constraints.maxHeight * 0.01,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.newSettingsCurrency[index]
                                        .abbreviation,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${controller.newSettingsCurrency[index].scale} ${controller.newSettingsCurrency[index].name.toLowerCase()}',
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: constraints.maxHeight * 0.02,
                            ),
                            child: Obx(
                              () => CupertinoSwitch(
                                value: controller
                                    .newSettingsCurrency[index].active.value,
                                onChanged: (bool newValue) =>
                                    controller.updateStatus(index, newValue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: constraints.maxHeight * 0.02,
                    ),
                    child: const Icon(
                      Icons.reorder,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
