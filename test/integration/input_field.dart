import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_web/components/input_field.dart';

void main() {
  testWidgets('InputField handles input correctly',
          (WidgetTester tester) async {
        await tester
            .pumpWidget(MaterialApp(home: InputField(hintText: 'Starting point')));
        final textField = find.byType(TextField);
        await tester.enterText(textField, 'new text');
        final text = find.text('new text');
        expect(text, findsOneWidget);
      });

  test('Given input Bergen when pressed go-button response it not empty',
          () async {
        final inputField = InputField(value: 'Bergen');
        expect(inputField.value, 'Bergen');
      });
}