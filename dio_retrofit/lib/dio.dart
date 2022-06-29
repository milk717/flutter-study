import 'package:dio/dio.dart';
import 'package:dio_retrofit/book_model.dart';
import 'package:dio_retrofit/naver_api_key.dart';
import 'package:json_annotation/json_annotation.dart';

var options = BaseOptions(
  baseUrl: 'https://openapi.naver.com/v1/search/book.json',
  connectTimeout: 5000,
  receiveTimeout: 3000,
  headers: {
    'X-Naver-Client-Id' : NaverClientId,
    'X-Naver-Client-Secret' : NaverClientSecret,
  }
);
Dio dio = Dio(options);
late Response response;

@JsonSerializable()
Future<List<Items>?> getSearchDataList({required String title}) async{
  BookSearchList bookSearchList;
  List<Items>? booList = [];
  try{
    response = await dio.get('',queryParameters: {'query': title});
    bookSearchList = BookSearchList.fromJson(response.data);
    booList = bookSearchList.items;
    print(booList.toString());
  }catch(e){
    print('error $e');
  }
  return booList;
}
