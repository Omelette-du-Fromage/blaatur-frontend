import 'package:flutter_test/flutter_test.dart';
import 'package:food_web/components/input_field.dart';

void main() {
  test(
      'Given input Bergen When Inputfield.value is called Then return string Bergen',
      () async {
    final inputField = InputField('Bergen');
    expect(inputField.value, 'Bergen');
  });
}
