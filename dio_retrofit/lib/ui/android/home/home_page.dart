import 'package:dio_retrofit/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Column(
        children: [
          Container(
            child: GetX<HomeController>(
              initState: (state){Get.find<HomeController>().getSearchResult(title: '');},
              builder: (controller){
                return ListView.builder(
                    itemCount: controller.bookList.length,
                    itemBuilder: (context,index){
                      var data = controller.bookList[index];
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(data.title ?? 'a'),
                          subtitle: Text(data?.publisher ?? ''),
                          trailing: Expanded(child: Image.network(data?.image ?? 'https://w.namu.la/s/85364aa0fe9abc03787c76940f25172ad737e53aad4f9f5b0934daad93eb9913512d08ef16194cd409cc2c635bd418dfd7423bf0adeac45b24c672333a8dbc1329e67062d7559cb6a1c9b0ebc8a39494b9e147a7871b6390f2c05e1690773c67ca2802abdd6f4c27b545e64da148c406')),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
