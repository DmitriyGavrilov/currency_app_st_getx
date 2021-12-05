import 'package:currency_app_st_getx/app/modules/main/controllers/main_controller.dart';
import 'package:currency_app_st_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Main screen
class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Курсы валют',
        ),
        actions: [
          Obx(
            () => !controller.isLoading.value && !controller.isError.value
                ? IconButton(
                    icon: const Icon(Icons.settings),
                    iconSize: 30.0,
                    onPressed: () {
                      controller.makeListWithChanges();
                      Get.toNamed(
                        Routes.settings,
                      );
                    },
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
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : !controller.isError.value
                    ? Column(
                        children: [
                          Container(
                            color: Theme.of(context).primaryColor.withOpacity(
                                  0.5,
                                ),
                            height: constraints.maxHeight * 0.06,
                            margin: EdgeInsets.only(
                              bottom: constraints.maxHeight * 0.01,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                controller.yesterdayCurrency.isNotEmpty
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          right: constraints.maxHeight * 0.01,
                                        ),
                                        child: Text(
                                          controller.getYesterdayDateText(),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: constraints.maxHeight * 0.01,
                                  ),
                                  child: Text(
                                    controller.getDateText(),
                                  ),
                                ),
                                controller.tomorrowCurrency.isNotEmpty
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          right: constraints.maxHeight * 0.01,
                                        ),
                                        child: Text(
                                          controller.getTomorrowDateText(),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => !controller.settingsChanged.value
                                  ? ListView.builder(
                                      itemBuilder: (ctx, index) => controller
                                              .currency[index].show.value
                                          ? Row(
                                              key: controller
                                                  .currency[index].key,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                      constraints.maxHeight *
                                                          0.01,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          controller
                                                              .currency[index]
                                                              .abbreviation,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${controller.currency[index].scale} ${controller.currency[index].name.toLowerCase()}',
                                                          overflow:
                                                              TextOverflow.clip,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                controller.yesterdayCurrency
                                                        .isNotEmpty
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          right: constraints
                                                                  .maxHeight *
                                                              0.01,
                                                        ),
                                                        child: Text(
                                                          controller
                                                              .currency[index]
                                                              .yesterdayRate
                                                              .toString(),
                                                        ),
                                                      )
                                                    : const SizedBox.shrink(),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right:
                                                        constraints.maxHeight *
                                                            0.02,
                                                  ),
                                                  child: Text(
                                                    controller
                                                        .currency[index].rate
                                                        .toString(),
                                                  ),
                                                ),
                                                controller.tomorrowCurrency
                                                        .isNotEmpty
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          right: constraints
                                                                  .maxHeight *
                                                              0.01,
                                                        ),
                                                        child: SizedBox(
                                                          width: 55.0,
                                                          child: Text(
                                                            controller
                                                                .currency[index]
                                                                .tomorrowRate
                                                                .toString(),
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox.shrink(),
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                      itemCount: controller.currency.length,
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                            ),
                          ),
                        ],
                      )
                    : const Center(
                        child: Text(
                          'Не удалось получить курсы валют',
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
