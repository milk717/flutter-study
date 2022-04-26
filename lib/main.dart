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
          appBar: AppBar(),
          body: ListView(
            children: [
              a,a,a,a,a,a,
            ],
          ),
      ),
    );
  }
}

var a = SizedBox(
  child: Text('안녕',style: TextStyle(fontSize: 100),),
);

