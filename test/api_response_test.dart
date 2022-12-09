import 'package:coding_challenge/data/response/api_response.dart';
import 'package:coding_challenge/data/response/status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "APIResponse create loading",
    () {
      var result = ApiResponse(Status.LOADING, null, null);
      expect(result, isInstanceOf());
    },
  );

  test(
    "APIResponse create completed",
    () {
      var result = ApiResponse(Status.COMPLETED, "data", "").toString();
      expect(result, isInstanceOf());
    },
  );

  test('To String', () {});
}
