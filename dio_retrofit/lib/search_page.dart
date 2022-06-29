 import 'package:dio_retrofit/data/model/book_model.dart';
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
                      Items? data = snapshot.data?[index];
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(data?.title ?? ''),
                          subtitle: Text(data?.publisher ?? ''),
                          trailing: Expanded(child: Image.network(data?.image ?? 'https://w.namu.la/s/85364aa0fe9abc03787c76940f25172ad737e53aad4f9f5b0934daad93eb9913512d08ef16194cd409cc2c635bd418dfd7423bf0adeac45b24c672333a8dbc1329e67062d7559cb6a1c9b0ebc8a39494b9e147a7871b6390f2c05e1690773c67ca2802abdd6f4c27b545e64da148c406')),
                        ),
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
