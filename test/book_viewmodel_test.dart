import 'package:coding_challenge/view_model/book_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("fetching a book", () {
    String ibsn = '9781617294136';
    var result = BookViewModel().fetchBookDetailsApi(ibsn);

    expect(result, isInstanceOf());
  });
}
