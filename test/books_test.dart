import 'package:coding_challenge/models/books.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var bookInfo = BookInfo(
      title: 'tittle',
      subtitle: 'subtittle',
      isbn13: 'isbn',
      price: 'price',
      image: 'image',
      url: 'url');

  var books =
      Books(error: 'error', total: 'total', page: 'page', books: [bookInfo]);

  test('Create the object', () {
    expect(books, isInstanceOf());
  });

  test('BookInfo to Json', () {
    var result = bookInfo.toJson();
    var expectedResult = {
      'title': 'tittle',
      'subtitle': 'subtittle',
      'isbn13': 'isbn',
      'price': 'price',
      'image': 'image',
      'url': 'url'
    };
    expect(result, expectedResult);
  });

  test('Books to Json', () {
    var result = books.toJson();
    var expectedResult = {
      'error': 'error',
      'total': 'total',
      'page': 'page',
      'books': [
        {
          'title': 'tittle',
          'subtitle': 'subtittle',
          'isbn13': 'isbn',
          'price': 'price',
          'image': 'image',
          'url': 'url'
        }
      ]
    };
    expect(result, expectedResult);
  });
}
