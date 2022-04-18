import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_dio/Model/post_model.dart';
import 'package:getx_dio/Service/remote_service.dart';

class HomeController extends GetxController with StateMixin<List<PostModel>> {
  final RemoteService remoteService;

  HomeController(this.remoteService);

  late ScrollController scrollController;

  RxList<PostModel> dataList = <PostModel>[].obs;
  RxInt limit = 9.obs;
  RxBool showLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    getData();
    scrollController.addListener(() async {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        await Future.delayed(const Duration(seconds: 1));
        if (limit.value + 9 < dataList.length - 1) {
          limit.value = limit.value + 10;
        } else {
          showLoading.value = false;
        }
      }
    });
  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    await remoteService.getAllPost().then(
      (value) {
        dataList.value = value;
        change(dataList, status: RxStatus.success());
      },
      onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      },
    );
  }

  postData() => remoteService.postData();
  deleteData() => remoteService.deleteData();

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
