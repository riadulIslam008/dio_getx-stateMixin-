import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/Model/post_model.dart';

class RemoteService {
  final Dio dio;
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  RemoteService(this.dio);

  Future<List<PostModel>> getAllPost() async {
    List<PostModel> data = [];
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      for (var i = 0; i < response.data.length; i++) {
        data.add(PostModel.fromMap(response.data[i]));
      }
    }
    return data;
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
