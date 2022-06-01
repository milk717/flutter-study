import 'package:dio/dio.dart';
import 'package:dio_retrofit/book_model.dart';
import 'package:dio_retrofit/naver_api_key.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

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

Future<List> getSearchDataList({required String title}) async{
  List book = [];
  try{
    response = await dio.get('',queryParameters: {'query': title});
    var data = response.data;
    book = data['items'];
    // print(data.toString());
  }catch(e){
    print('error $e');
  }
  return book;
}
