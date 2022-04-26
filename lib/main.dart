import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요~
}
//메인페이지 만들기
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('앱 이름'),
          leading: Icon(Icons.add_box_outlined),
          actions: const [Icon(Icons.star), Icon(Icons.airplanemode_active)],
        ), //상단
        body: SizedBox(
          child: IconButton(
            icon: Icon(Icons.star),
            onPressed: (){},
          )
        )
      )
    );
  }
}
