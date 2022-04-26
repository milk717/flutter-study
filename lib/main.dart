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
        home: Scaffold( //레이아웃을 상 중 하로 나누어줌
          appBar: AppBar(
            title: Text('앱 이름'),
          ), //상단
          body: Align(  //박스 위치 정렬
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,height: 150, //color: Colors.blue, -> BoxDecoration 을 키면 box 안에서만 색상지정해야함
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.fromLTRB(50, 70, 50, 0),
              child: Text('hello'),
              decoration: BoxDecoration(  //세부적인 디자인할때
                  border: Border.all(color: Colors.blueAccent)
              ),
            ),
          ),
        )
    );
  }
}
