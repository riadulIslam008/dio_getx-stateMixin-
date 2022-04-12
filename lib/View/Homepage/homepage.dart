import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/View/Homepage/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => controller.getData.isEmpty
                ? const Center(child: Text("Data Loading...."))
                : const Center(child: Text("Data Loaded. Look at the Console")),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () => controller.postData(),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Post Data"),
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () => controller.deleteData(),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Delete Data"),
            ),
          ),
        ],
      ),
    );
  }
}
