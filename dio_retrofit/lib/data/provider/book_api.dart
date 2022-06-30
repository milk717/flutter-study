import 'package:dio/dio.dart';
import 'package:dio_retrofit/data/model/book_model.dart';
import 'package:dio_retrofit/naver_api_key.dart';

const baseUrl = 'https://openapi.naver.com/v1/search/book.json';
final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      'X-Naver-Client-Id' : NaverClientId,
      'X-Naver-Client-Secret' : NaverClientSecret,
    }
);

class BookApiClient{
  Dio dio = Dio(options);

  getSearchBook({required String title}) async{
    BookSearchResult searchResult;
    List<Items>? bookList = [];
    try{
      Response response = await dio.get('', queryParameters: {'query' : title});
      searchResult = BookSearchResult.fromJson(response.data);
      bookList = searchResult.items;
    }catch(e){
      print('error $e');
    }
    bookList!.forEach((element) {print(element.title);});
    return bookList;
  }
}