import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp()
    )
  );  //앱 시작해주세요~
}

//메인페이지 만들기
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return DialogUI();
                });
              },
            );
          }
        ),
        appBar: AppBar(),
        body: Text('body'),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                IconButton(icon: Icon(Icons.phone),onPressed: (){},),
                IconButton(icon: Icon(Icons.message),onPressed: (){},),
                IconButton(icon: Icon(Icons.contact_page),onPressed: (){},),
              ],
            ),
          ),
        ),
      );
  }
}

class DialogUI extends StatelessWidget {
  const DialogUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(child:
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text(''),TextField(),Text(''),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text('확인'),
              onPressed: (){},
            ),
            TextButton(
              child: Text('취소'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        )],
    ),
    );
  }
}



