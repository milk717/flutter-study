import 'package:dio_retrofit/data/provider/book_api.dart';

class BookRepository{
  final BookApiClient bookApiClient;

  BookRepository({required this.bookApiClient});

  getSearchBook({required String title}){
    return bookApiClient.getSearchBook(title: title);
  }
}