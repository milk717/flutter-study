 import 'package:dio_retrofit/book_model.dart';
import 'package:dio_retrofit/dio.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;
  late Future<List<Items>?> searchResult;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    searchResult = Future(() => []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio & retrofit sample'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onSubmitted: (String vale){
              searchResult = getSearchDataList(title: _controller.text);
            },
          ),
          FutureBuilder<List<Items>?>(
            future: searchResult,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) {
                return const CircularProgressIndicator();
              }else if(snapshot.hasData){
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(snapshot.data?[index].title ?? ''),
                      );
                    }
                  ),
                );
              }else{
                return Text('error');
              }
            },
          ),
        ],
      ),
    );
  }
}
