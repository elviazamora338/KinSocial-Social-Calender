import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver? driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver?.close();
    }
  });
  group('Happy Paths', () {
  
      test("should be able to login", () async {
      print('Tapping "Login" button');
      await driver?.tap(find.text('Login'));
      await Future.delayed(const Duration(seconds: 1)); // Add
      // your code here
    });
  });

  group('Sad Paths', () {
  
  });
}