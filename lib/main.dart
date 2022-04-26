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
          body: Row(
            children: [
              TextBoxCustom(),
              a
            ],
          ),
      ),
    );
  }
}

var a = SizedBox(
  child: Text('안녕'),
);

class TextBoxCustom extends StatelessWidget {
  const TextBoxCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text('안녕'),
    );
  }
}
