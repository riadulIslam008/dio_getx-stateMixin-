import 'package:get/get.dart';
import 'package:getx_dio/Model/post_model.dart';
import 'package:getx_dio/Service/remote_service.dart';

class HomeController extends GetxController with StateMixin<List<PostModel>> {
  final RemoteService remoteService;

  HomeController(this.remoteService);

  List<PostModel> dataList = <PostModel>[];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    await remoteService.getAllPost().then(
      (value) {
        dataList = value;
        change(dataList, status: RxStatus.success());
      },
      onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      },
    );
  }

  postData() => remoteService.postData();
  deleteData() => remoteService.deleteData();
}
