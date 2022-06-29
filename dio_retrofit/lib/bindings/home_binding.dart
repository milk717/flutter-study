import 'package:dio_retrofit/controller/home/home_controller.dart';
import 'package:dio_retrofit/data/provider/book_api.dart';
import 'package:dio_retrofit/data/repository/book_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() =>
        HomeController(bookRepository: BookRepository(bookApiClient: BookApiClient())));
  }
}