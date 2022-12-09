import 'package:coding_challenge/view_model/books_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("fetching all books", () {
    var result = BooksViewModel().fetchBooksListApi();

    expect(result, isInstanceOf());
  });
}
