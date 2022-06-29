import 'package:dio_retrofit/controller/details/details_controller.dart';
import 'package:get/get.dart';

class DetailsBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}