import 'package:dio_retrofit/dio.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getSearchDataList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio & retrofit sample'),
      ),
    );
  }
}
