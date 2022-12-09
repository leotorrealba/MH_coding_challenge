import 'package:coding_challenge/data/app_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "Fetch Data Exception",
    () {
      String exceptionMessage = '';

      var result = FetchDataException(exceptionMessage);

      expect(result, isInstanceOf());
    },
  );
}
