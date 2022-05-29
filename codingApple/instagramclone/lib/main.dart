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
  List data = [];
  int index = 0;

  @override
  void initState(){
    getData();
  }

  getData() async {
    var response = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    data = jsonDecode(response.body);
  }

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
      body: (index==0)?HomeWidget(data: data,):ShoppingWidget(result: data[0].toString(),),
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
    );
  }
}

class HomeWidget extends StatelessWidget {
  HomeWidget({
    Key? key,
    required this.data
  }) : super(key: key);

  List data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context,index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(data[index]['image']),
              Text('좋아요 ${data[index]['likes']}'),
              Text(data[index]['user']),
              Text(data[index]['content']),
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
