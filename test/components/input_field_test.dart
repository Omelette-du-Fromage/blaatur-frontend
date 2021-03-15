import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_web/components/input_field.dart';

void main() {
  testWidgets('InputField handles input correctly',
      (WidgetTester tester) async {
    InputField inputField = InputField('default');
    await tester.pumpWidget(inputField);
    await tester.enterText(find.byType(TextField), 'Bergen');
    await tester.pump();
    expect(defaultTextFinder, findsOneWidget);
  });

  test(
      'Given input Hint text When Inputfield.value Then return string Hint text',
      () async {
    final inputField = InputField('Hint text');
    expect(inputField.value, 'Hint text');
  });
}
