import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/View/Homepage/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => controller.postData(),
            child: const Text(
              "Get Data",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          TextButton(
            onPressed: () => controller.deleteData(),
            child: const Text(
              "Delete Data",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: controller.obx(
        (state) => Obx(
          () => ListView.separated(
            controller: controller.scrollController,
            itemCount: state!.isNotEmpty ? controller.limit.value + 1 : 0,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            itemBuilder: (_, index) {
              if ((index != controller.limit.value)) {
                return ListTile(
                  title: Text(
                    controller.dataList[index].title.capitalizeFirst!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child:
                        Text(controller.dataList[index].body.capitalizeFirst!),
                  ),
                );
              } else {
                return Obx(
                  () => Center(
                    child: controller.showLoading.value
                        ? const CircularProgressIndicator()
                        : const Text("No More Data"),
                  ),
                );
              }
            },
            separatorBuilder: (_, index) {
              return const Divider(
                color: Colors.grey,
              );
            },
          ),
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(child: Text(error.toString())),
        onEmpty: const Center(child: Text("No Data")),
      ),
    );
  }
}
