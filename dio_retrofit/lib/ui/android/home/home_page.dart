import 'package:dio_retrofit/controller/home/home_controller.dart';
import 'package:dio_retrofit/data/model/book_model.dart';
import 'package:dio_retrofit/ui/android/home/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          SearchBox(),
          FutureBuilder<List<Items>>(
            future: controller.bookList,
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return const CircularProgressIndicator();
              }else if(snapshot.hasData){
                return Expanded(
                  child: Obx(
                        () => ListView.builder(
                        itemCount: controller.bookList.length,
                        itemBuilder: (context, index) {
                          Items? data = controller.bookList[index];
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              title: Text(data?.title ?? 'a'),
                              subtitle: Text(data?.publisher ?? ''),
                              trailing: Image.network(data?.image ??
                                  'https://milk717.github.io/app/kid1412.jpg'),
                            ),
                          );
                        }),
                  ),
                );
              }else{
                return Text('error');
              }
            }
          ),
        ],
      ),
    );
  }
}
