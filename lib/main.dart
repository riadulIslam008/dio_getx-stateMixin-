import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/Dependenci_Injection/bindings.dart';
import 'package:getx_dio/View/Homepage/home_with_pagination.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dio Api Demo',
      initialBinding: Binding(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const ArticlesListView(),
    );
  }
}
