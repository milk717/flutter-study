import 'package:dio_retrofit/routes/app_pages.dart';
import 'package:dio_retrofit/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()=>runApp(
    GetMaterialApp(
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
));


