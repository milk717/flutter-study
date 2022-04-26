import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  //앱 시작해주세요~
}
//메인페이지 만들기
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('button'),
          onPressed: (){
            print(a.toString());
            a++;
          },
        ),
        appBar: AppBar(),
        body: ListView.builder(
              itemCount: 17,
              itemBuilder: (c,i){
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black
                    ),
                    child: Icon(Icons.person_rounded,color: Colors.white,),
                  ),
                  title: Text('김수민',style: TextStyle(fontSize: 24),),
                );
              }
          ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.phone),
                Icon(Icons.message),
                Icon(Icons.contact_page),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


