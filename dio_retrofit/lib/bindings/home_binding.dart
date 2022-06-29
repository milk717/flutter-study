import 'package:dio_retrofit/controller/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}