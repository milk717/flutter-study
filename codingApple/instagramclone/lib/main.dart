import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instagramclone/style.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


void main() => runApp(
      MaterialApp(
        home: MyApp(),
        theme: customStyle(),
        // initialRoute: '/',
        // routes: {
        //   '/':(c)=>Text('첫 페이지'),
        //   '/detail':(c)=>Text('두 번째 페이지'),
        // },
      ),
    );

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String result = '';
  List data = [];
  int index = 0;
  var scroll = ScrollController();
  int get = 0;
  var userImage;

  @override
  void initState() {
    super.initState();
    getData();
    scroll.addListener(() async {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        get++;
        var response;
        switch (get) {
          case 1:
            {
              response = await http.get(
                  Uri.parse('https://codingapple1.github.io/app/more1.json'));
              break;
            }
          case 2:
            {
              response = await http.get(
                  Uri.parse('https://codingapple1.github.io/app/more2.json'));
              break;
            }
        }
        setState(() {
          data.add(jsonDecode(response.body));
        });
        print('스크롤끝');
      }
    });
  }

  getData() async {
    var response =
        await http.get(Uri.parse('https://milk717.github.io/app/data.json'));
    print(response);
    setState(() {
      data = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            onPressed: () async {
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              userImage = File(image?.path ?? '');

              var content = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => Upload(
                          userImage: userImage,
                        )),
              );
              setState(() {
                data.insert(0, {
                  'id': data.length,
                  'image': userImage,
                  'likes': 0,
                  'date': 'July 17',
                  'content': content,
                  'liked': false,
                  'user': 'Sumin'
                });
              });
            },
            icon: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: (index == 0)
          ? HomeWidget(
              data: data,
              scroll: scroll,
            )
          : ShoppingWidget(
              result: data.toString(),
            ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: index,
        onTap: (i) {
          print(i);
          setState(() {
            index = i;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag),
              label: '쇼핑'),
        ],
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  HomeWidget({Key? key, required this.data, required this.scroll})
      : super(key: key);

  List data;
  var scroll;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Text('로딩중');
    } else {
      return ListView.builder(
          itemCount: data.length,
          controller: scroll,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                data[index]['image'].runtimeType == String
                    ? Image.network(data[index]['image'])
                    : Image.file(data[index]['image']),
                Text('좋아요 ${data[index]['likes']}'),
                GestureDetector(
                  child: Text(data[index]['user']),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        //a1 = 0~1로 페이지 전환됨에 따라 증가(새로운 페이지)
                        //a2 = 0~1로 페이지 전환됨에 따라 증가(기존 페이지)
                        pageBuilder: (c, a1, a2) => Profile(),
                        transitionsBuilder: (c, a1, a2, child) =>
                            FadeTransition(
                          opacity: a1,
                          child: child,
                        ),
                        transitionDuration: Duration(milliseconds: 200),
                      ),
                    );
                  },
                ),
                Text(data[index]['content']),
              ],
            );
          });
    }
  }
}

class ShoppingWidget extends StatelessWidget {
  ShoppingWidget({Key? key, this.result}) : super(key: key);

  String? result;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$result'));
  }
}

class Upload extends StatelessWidget {
  Upload({Key? key, required this.userImage}) : super(key: key);

  final userImage;
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('글 등록')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.file(userImage),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'content',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, textController.text);
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('프로필 페이지'),
    );
  }
}
