import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instagramclone/style.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
  theme: customStyle(),
));

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String result = '';
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.add_box_outlined),
          )
        ],
      ),
      body: (index==0)?HomeWidget():ShoppingWidget(result: result,),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: index,
        onTap: (i){
          print(i);
          setState((){
            index = i;
          });
        },
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '홈'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: '쇼핑'
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          var response = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
          print(jsonDecode(response.body));
          setState((){
            result = jsonDecode(response.body).toString();
          });
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context,index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/conan.jpg'),
              Text('좋아요 100'),
              Text('글쓴이'),
              Text('글내용'),
            ],
          );
        }
    );
  }
}

class ShoppingWidget extends StatelessWidget {
  ShoppingWidget({
    Key? key,
    this.result
  }) : super(key: key);

  String? result;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$result'));
  }
}
