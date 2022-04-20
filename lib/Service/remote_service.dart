import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/Model/list_postmodel.dart';
import 'package:getx_dio/Model/post_model.dart';

class RemoteService {
  final Dio dio;
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  RemoteService(this.dio);

  getAllPost(int page) async {
    const int _limit = 10;

    return await dio.get("$url?_limit=$_limit&_page=$page").then((values) {
      if (values.statusCode == 200) {
        List<PostModel> data = [];
        values.data.forEach((eachValue) {
           data.add(PostModel.fromMap(eachValue));
        });

        return ListPage(grandTotalCount: values.data.length, itemList: data);
      }
    });
  }

  Future<void> postData() async {
    dynamic _data = {
      "userId": 100,
      "title": "Riadul Islam",
      "body": "Crazy Flutter",
    };

    final response = await dio.post(
      url,
      data: _data,
      options: Options(
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      ),
    );
    if (response.statusCode == 201) {
      Get.snackbar("Hey", "Data Post successfully",
          backgroundColor: Colors.teal);
    } else {
      Get.snackbar("Hey", "Data Post Failed", backgroundColor: Colors.red);
    }
  }

  Future<void> deleteData() async {
    final response = await dio.delete(
      "$url/100",
    );
    if (response.statusCode == 200) {
      Get.snackbar("Hey", "Data Delete successfully",
          backgroundColor: Colors.teal);
    } else {
      Get.snackbar("Hey", "Data Delete Failed", backgroundColor: Colors.red);
    }
  }
}
