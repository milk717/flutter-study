import 'package:dio_retrofit/data/model/book_model.dart';
import 'package:dio_retrofit/data/repository/book_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final BookRepository bookRepository;
  HomeController({required this.bookRepository});

  late final RxList<Items> _bookList;
  get bookList => _bookList.value;
  set bookList(items) => _bookList.value = items;

  final RxString inputText = "".obs;
  final TextEditingController textEditingController = TextEditingController();

  getSearchResult({required String title}){
    bookRepository.getSearchBook(title: title).then((data){bookList = data;});
  }

  sendButtonClickEvent(){
    getSearchResult(title: textEditingController.value.text);
    textEditingController.clear();
  }

  Future<List<Items>> getFuture() async{
    //await Future.delayed(Duration(seconds: 1));
    return _bookList.value;
  }
}