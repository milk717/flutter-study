import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

var options = BaseOptions(
  baseUrl: 'https://reqres.in/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio dio = Dio(options);
late Response response;

getUserList() async{
  response = await dio.get('api/users?page=2');
  print(response.data.toString());
  response = await dio.get('api/users', queryParameters: {'page': 1});
  print(response.data.toString());
}
getUser() async{
 response = await dio.get('api/users/2');
 print(response.data.toString());
}
postUser() async{
  response = await dio.post('api/users',data:{'name':'summin', 'job':'student'});
  print(response.data.toString());
}
