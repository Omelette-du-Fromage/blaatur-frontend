import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_web/components/input_field.dart';

void main() {
  testWidgets('InputField handles input correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: InputField('Starting point')));
    final textField = find.byType(TextField);
    await tester.enterText(textField, 'new text');
    final text = find.text('new text');
    expect(text, findsOneWidget);
  });

  test(
      'Given input Hint text When Inputfield.value Then return string Starting point',
      () async {
    final inputField = InputField('Starting point');
    expect(inputField.value, 'Starting point');
  });
}
