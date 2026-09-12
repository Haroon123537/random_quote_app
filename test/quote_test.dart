import 'package:flutter_test/flutter_test.dart';

int addnumbers(int a, int b) {
  return a + b;
}

void main() {
  test("Both number should be added correctly", () {
    int result = addnumbers(6, 4);

    expect(result, 10);
  });
}
