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
        appBar: AppBar(), //상단
        body: Center(
          child: Container(
            color: Colors.blueGrey,
            height: 300,
            child: Row(  //body == 중단, Row == 레이아웃을 가로로 배치 (Column == 세로로 배치)
              mainAxisAlignment: MainAxisAlignment.center,  //가로축 정렬 (CSS flexBox 랑 비슷한가???)
              crossAxisAlignment: CrossAxisAlignment.center,  //세로축 정렬 
              /*
                현재 Row 여서 정축이 가로니까 mainAxisAlignment 가 가로축이 되고,
                crossAxisAlignment 가 세로축이 된다. Column 으로 설정 시 반대
              */
              children: const [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
              ],
            ),
          ),
        ),
          bottomNavigationBar: Text("Bottom"),  //하단
      )
    );
  }
}
