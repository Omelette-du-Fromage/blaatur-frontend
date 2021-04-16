// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final goButtonFinder = find.byValueKey('go_button_main_page');
    final inputFieldFinder = find.byValueKey('inputField_main_page');
    final responseTextFinder = find.byValueKey('response-from-backend');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test(
        'given inputField has value Bergen when go-button is pressed then response is not empty',
        () async {
      // Given
      await driver.tap(inputFieldFinder);
      await driver.enterText("Bergen");

      // When
      await driver.tap(goButtonFinder);

      // Then
      expect(await driver.getText(responseTextFinder), isNotEmpty);
    });
  });
}
