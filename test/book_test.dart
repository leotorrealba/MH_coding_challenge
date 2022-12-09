import 'package:coding_challenge/models/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var book = Book(
      error: 'error',
      title: 'title',
      subtitle: 'subtitle',
      authors: 'authors',
      publisher: 'publisher',
      language: 'language',
      isbn10: 'isbn10',
      isbn13: 'isbn13',
      pages: 'pages',
      year: 'year',
      rating: 'rating',
      desc: 'desc',
      price: 'price',
      image: 'image',
      url: 'url',
      pdf: <String, String>{});

  test('Create the object', () {
    expect(book, isInstanceOf());
  });

  test('Book to Json', () {
    var result = book.toJson();
    var expectedResult = {
      'error': 'error',
      'title': 'title',
      'subtitle': 'subtitle',
      'authors': 'authors',
      'publisher': 'publisher',
      'language': 'language',
      'isbn10': 'isbn10',
      'isbn13': 'isbn13',
      'pages': 'pages',
      'year': 'year',
      'rating': 'rating',
      'desc': 'desc',
      'price': 'price',
      'image': 'image',
      'url': 'url',
      'pdf': {}
    };
    expect(result, expectedResult);
  });
}
