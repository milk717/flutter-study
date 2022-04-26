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
            backgroundColor: Colors.white,
            title: Row(
              children: const [
                Text('대야동',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),),
                Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black),
              ],
            ),
            actions: <Widget> [ //const 하면 안됨 왜???? 아직은 모름
              IconButton(icon: Icon(Icons.search) ,color: Colors.black, onPressed: (){ print('click');}),
              IconButton(icon: Icon(Icons.menu) ,color: Colors.black, onPressed: (){ print('click');}),
              IconButton(icon: Icon(Icons.notifications_none) ,color: Colors.black, onPressed: (){ print('click');}),
            ],
          ),
          body: Container(
            width: double.infinity,
            height: 150,
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Image.asset("assets/conan.png", width: 150,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('PS5 플레이스테이션5 미개봉', style: TextStyle(fontSize: 18,),),
                        Text('시흥시 대야동 · 끌올 17분 전',style: TextStyle(color: Colors.grey),),
                        Text('800,000원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(onPressed: (){print('click');}, icon: Icon(Icons.favorite_border) ),
                            Text('17'),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}