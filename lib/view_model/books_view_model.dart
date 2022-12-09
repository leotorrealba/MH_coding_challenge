import 'package:coding_challenge/data/response/api_response.dart';
import 'package:coding_challenge/models/books.dart';
import 'package:coding_challenge/repository/books_repository.dart';
import 'package:flutter/material.dart';

class BooksViewModel with ChangeNotifier {
  final _booksRepository = BooksRepository();

  ApiResponse<Books> booksList = ApiResponse.loading();

  setBooksList(ApiResponse<Books> response) {
    booksList = response;
    notifyListeners();
  }

  Future<void> fetchBooksListApi() async {
    setBooksList(ApiResponse.loading());
    _booksRepository.fetchBooks().then((value) {
      setBooksList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setBooksList(ApiResponse.error(error.toString()));
    });
  }
}
