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
  var a = 1;
  plus(){
    setState(() {
      a++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return DialogUI(plus : plus);
                });
              },
            );
          }
        ),
        appBar: AppBar(),
        body: Text(a.toString()),
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
  const DialogUI({Key? key, this.plus}) : super(key: key);
  final plus;

  @override
  Widget build(BuildContext context) {
    return Dialog(child:
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [TextField(),Text(''),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text('확인'),
              onPressed: (){
                plus();
                Navigator.pop(context);
              },
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



