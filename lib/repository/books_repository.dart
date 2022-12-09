import 'package:coding_challenge/data/network/api_services.dart';
import 'package:coding_challenge/data/network/network_api_services.dart';
import 'package:coding_challenge/models/book.dart';
import 'package:coding_challenge/models/books.dart';
import 'package:coding_challenge/utils/urls.dart';

class BooksRepository {
  final APIServices _apiServices = NetworkAPIServices();

  Future<Books> fetchBooks() async {
    try {
      dynamic response = await _apiServices.getApiResponse(AppUrl.booksUrl);
      return response = Books.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Book> fetchBook(String ibsn) async {
    String url = AppUrl.bookUrl + ibsn;
    try {
      dynamic response = await _apiServices.getApiResponse(url);
      return response = Book.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
