import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  const HttpApp({Key? key}) : super(key: key);

  @override
  State<HttpApp> createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Http Practice'),),
      body: Center(child: Text('result = ${result}'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var url = 'http://www.google.com';
          var response = await http.get(Uri.parse(url));
          setState((){
            result = response.body;
          });
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }
}

