import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp())); //앱 시작해주세요~
}

//메인페이지 만들기
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  getPermission() async {
    var status = await Permission.contacts.status;
    print(status);
    if(status.isGranted){
      print('허락됨');
    }else if(status.isDenied){
      print('거절됨');
      Permission.contacts.request();
    }
  }

  List nameList = ['코난','나루토','사스케','원피스'];

  addName(String name){
    setState(() {
      nameList.add(name);
    });
  }
  @override`
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            showDialog(context: context, builder: (context){
              return DialogUI(addName: addName,);
            });
          },
        );
      }),
      appBar: AppBar(
        title:Text('오늘은 어린이날~ 나는 어른이'),
        actions: [
          IconButton(onPressed: (){
            getPermission();
          }, icon: Icon(Icons.account_box))
        ],
      ),
      body: ListView.builder(
          itemCount: nameList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black),
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                ),
              ),
              title: Text('${nameList[index]}'),
            );
          }),
      bottomNavigationBar: BottomAppBar(child: Text('bottomBar'),),
    );
  }
}


class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addName}) : super(key: key);
  final addName;
  var inputName = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text('이름 추가 등록'),
      content: TextField(
        controller: inputName,
      ),
      actions: <Widget>[
        TextButton(child: Text('추가'),onPressed: (){
          if(inputName.text.isNotEmpty){
            addName(inputName.text);
          }
          Navigator.pop(context);
        },)
      ],
    );
  }
}
