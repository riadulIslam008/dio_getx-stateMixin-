import 'package:get/get.dart';
import 'package:getx_dio/Model/post_model.dart';
import 'package:getx_dio/Service/remote_service.dart';

class HomeController extends GetxController {
  final RemoteService remoteService;

  HomeController(this.remoteService);

  RxList<PostModel> getData = <PostModel>[].obs;

  @override
  void onInit() {
    remoteService.getAllPost().then((value) {
      getData.value = value;
    });

    super.onInit();
  }

  postData() => remoteService.postData();
  deleteData() => remoteService.deleteData();

  @override
  void onClose() {
    super.onClose();
  }
}
