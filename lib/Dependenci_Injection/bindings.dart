import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:getx_dio/Service/remote_service.dart';
import 'package:getx_dio/View/Homepage/home_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Dio _dio = Dio();
    RemoteService _remoteService = RemoteService(_dio);
    Get.lazyPut<HomeController>(() => HomeController(_remoteService));
  }
}
