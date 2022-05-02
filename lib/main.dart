import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  //앱 시작해주세요~
}

//메인페이지 만들기
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var like = [0,0,0];
  var name = ['나루토','코난','원피스'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
              itemCount: 3,
              itemBuilder: (c,i){
                return ListTile(
                  leading: Text(like[i].toString()),
                  title: Text(name[i]),
                  trailing: ElevatedButton(
                    child: Text('좋아요'),
                    onPressed: (){
                      setState(() {
                        like[i]++;
                      });
                    },
                  ),
                );
              }
          ),
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
      ),
    );
  }
}


