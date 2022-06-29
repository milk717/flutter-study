import 'package:dio_retrofit/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Container(
        child: GetX<HomeController>(
          initState: (state){Get.find<HomeController>().getSearchResult(title: 'conan');},
          builder: (controller){
            return ListView.builder(
              itemCount: controller.bookList.length,
                itemBuilder: (context,index){
                return ListTile(
                  title: Text(controller.bookList[index].title ?? 'a'),
                );
            });
          },
        ),
      ),
    );
  }
}
