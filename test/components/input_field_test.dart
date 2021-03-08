import 'package:flutter_test/flutter_test.dart';
import 'package:food_web/components/input_field.dart';

void main() {
  test(
      'Given input Hint text When Inputfield.value is called Then return string Hint text',
      () async {
    final inputField = InputField('Hint text');
    expect(inputField.value, 'Hint text');
  });
}
