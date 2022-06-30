import 'package:dio_retrofit/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  SearchBox({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(flex: 9, child: TextField(
            controller: controller.textEditingController,
            onSubmitted: controller.sendButtonClickEvent(),
          )),
          Flexible(flex: 1, child: IconButton(
            icon: Icon(Icons.send),
            onPressed: () => controller.sendButtonClickEvent() ,
          ))
        ],
      ),
    );
  }
}
