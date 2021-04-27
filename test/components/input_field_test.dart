import 'package:Blaatur/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Blaatur/components/input_field.dart';

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

  test('Given input Bergen When Inputfield.value Then return string Bergen',
      () async {
    final inputField = InputField(value: 'Bergen');
    expect(inputField.value, 'Bergen');
  });

  testWidgets('When input field is tapped hint text goes away',
          (WidgetTester tester) async {

        final inputField = InputField(
            key: Key('inputField_main'),
            hintText: 'Bergen',
            value: '');
        await tester
            .pumpWidget(MaterialApp(home: TravelForm(
            inputFieldStartingPoint: inputField,
            callback: MainPage.callback)));
        final inputFieldTester = find.byKey(Key('inputField_main'));
        await tester.tap(inputFieldTester);
        await tester.pump();
        expect(inputField.hintText, ' ');
  });

  testWidgets('Given input field is empty user is displayed an error',
          (WidgetTester tester) async {

        final inputField = InputField(
            key: Key('inputField_main'),
            hintText: 'Bergen',
            value: '');
        await tester
            .pumpWidget(MaterialApp(home: TravelForm(
            inputFieldStartingPoint: inputField,
            callback: MainPage.callback)));

        final goButton = find.byKey(Key('go_button_main_page'));
        final inputFieldTester = find.byKey(Key('inputField_main'));
        await tester.tap(inputFieldTester);
        await tester.press(goButton);
        await tester.pump();

        expect(MainPage.callback, prints(''));
      });
}
