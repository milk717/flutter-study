import 'package:dio_retrofit/bindings/details_binding.dart';
import 'package:dio_retrofit/bindings/home_binding.dart';
import 'package:dio_retrofit/ui/android/details/details_page.dart';
import 'package:dio_retrofit/ui/android/home/home_page.dart';
import 'package:get/get.dart';
import 'package:dio_retrofit/routes/app_routes.dart';

class AppPages{
  static final pages=[
    GetPage(
      name: Routes.INITIAL, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
      name: Routes.DETAILS,
      page: ()=>DetailsPage(),
      binding: DetailsBinding()
    ),
  ];
}