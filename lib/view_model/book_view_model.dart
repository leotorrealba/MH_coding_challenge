import 'package:coding_challenge/data/response/api_response.dart';
import 'package:coding_challenge/models/book.dart';
import 'package:coding_challenge/repository/books_repository.dart';
import 'package:flutter/material.dart';

class BookViewModel with ChangeNotifier {
  final _booksRepository = BooksRepository();

  ApiResponse<Book> bookDetail = ApiResponse.loading();

  setBookDetails(ApiResponse<Book> response) {
    bookDetail = response;
    notifyListeners();
  }

  Future<void> fetchBookDetailsApi(String ibsn) async {
    setBookDetails(ApiResponse.loading());
    _booksRepository.fetchBook(ibsn).then((value) {
      setBookDetails(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setBookDetails(ApiResponse.error(error.toString()));
    });
  }
}
