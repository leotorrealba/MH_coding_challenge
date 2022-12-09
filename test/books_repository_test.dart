import 'package:coding_challenge/repository/books_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("fetchBooks", () async {
    BooksRepository booksRepository = BooksRepository();
    bool done = false;
    var fetch = (await booksRepository.fetchBooks()).books;
    if (fetch != null) {
      done = true;
    }
    expect(done, true);
  });

  test("fetchBook", () async {
    BooksRepository booksRepository = BooksRepository();
    bool done = false;
    var fetch = (await booksRepository.fetchBook('9781617294136'));
    if (fetch != null) {
      done = true;
    }
    expect(done, true);
  });
}
