import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application/httpAccess.dart';

void main() {
  test('http get test', () async {
    final http = HttpAccess();
    var body = await http.get();
    expect(body.length, isNonZero);
  });

  test('http put test', () async {
    final http = HttpAccess();
    var body = await http.get();
    expect(body.length, isNonZero);
  });
}
