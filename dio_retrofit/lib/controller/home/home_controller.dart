import 'package:dio_retrofit/data/model/book_model.dart';
import 'package:dio_retrofit/data/repository/book_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final BookRepository bookRepository;
  HomeController({required this.bookRepository});

  final RxList _bookList = [].obs;
  get bookList => _bookList.value;
  set bookList(items) => _bookList.value = items;

  getSearchResult({required String title}){
    bookRepository.getSearchBook(title: title).then((data){bookList = data;});
  }

}