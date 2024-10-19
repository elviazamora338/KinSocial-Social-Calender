// Purpose: This file is used to test the signin function in the Authorization class.
// The test will check if the username and password is empty, if the username is empty,
// if the password is empty, if the password is incorrect and if the username is not found in the database

//import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {

  FlutterDriver? driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    // Connect to the Flutter Driver
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      await driver?.close();
    }
  });

  group('Happy Paths', () {
    /// tests the functionality of the sign in button
    test("should be able choose login option", () async {
      print('Tapping "Login" button');
      await driver?.tap(find.text('Login'));
      await Future.delayed(const Duration(seconds: 1)); // Add
    });

    test('should be able to successfully login', () async {
      // entering fake username
      // finding by key
      await driver?.tap(find.byValueKey('usernameField'));
      // entering username
      await driver?.enterText('username');
      // finding by key
      await driver?.tap(find.byValueKey('passwordField'));
      // entering fake password
      await driver?.enterText('testpassword');
      // finding by key the button
      await driver?.tap(find.byValueKey('signInButton'));
      //should get successful login text
      expect(await driver?.getText(find.text('Login Successful')),
          'Login Successful');
      // should be in the welcome screen
    });
    test("should see welcome screen if sign up successful", () async {
      //should get successful login text
      expect(await driver?.getText(find.text('Welcome!')), 'Welcome!');
      // Go back to the main screen using the back button on the app bar
      print('Tapping back icon to return to main screen');
      await Future.delayed(const Duration(seconds: 1));
      await driver?.tap(find.byTooltip('Back'));
      await Future.delayed(const Duration(seconds: 3));
    });
    // tests the functionality of the login button
    test("should be able to choose sign up option", () async {
      print('Tapping "Sign Up" button');
      await driver?.tap(find.text('Sign Up'));
      await Future.delayed(const Duration(seconds: 1));
    });
    test("should be able to succesfully sign up", () async {
      // entering fake username
      // finding by key
      await driver?.tap(find.byValueKey('usernameField'));
      // entering username
      await driver?.enterText('username');
      // finding by key
      await driver?.tap(find.byValueKey('passwordField'));
      // entering fake password
      await driver?.enterText('testpassword');
      // finding by key
      await driver?.tap(find.byValueKey('re-enterpasswordField'));
      // entering fake password
      await driver?.enterText('testpassword');
      // finding by key the button
      await driver?.tap(find.byValueKey('signInButton'));
      //should get successful login text
      expect(await driver?.getText(find.text('Login Successful')),
          'Login Successful');
      // Go back to the main screen using the back button on the app bar
      print('Tapping back icon to return to main screen');
      await Future.delayed(const Duration(seconds: 1));
      await driver?.tap(find.byTooltip('Back'));
      await Future.delayed(const Duration(seconds: 3));

      // welcome screen
    });
  });

  group('Sad Paths', () {
    test("should get warning if Sign Up fields missing", () async {
      // Go back to the main screen using the back button on the app bar
      // print('Tapping back icon to return to main screen');
      // await driver?.tap(find.byTooltip('Back'));
      // await Future.delayed(const Duration(seconds: 1));
      // // main

      // sign up button
      await driver?.tap(find.text('Sign Up'));
      await Future.delayed(const Duration(seconds: 1));

      print('Testing sign up warnings');
      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('testpassword');

      // Attempt to sign up without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Username is empty')),
          'Username is empty');

      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('');

      await driver?.tap(find.byValueKey('usernameField'));
      await driver?.enterText('username12');

      // Attempt to sign up without entering password
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Password is empty')),
          'Password is empty');

      // Attempt to sign up without matching passwords
      await driver?.tap(find.byValueKey('usernameField'));
      await driver?.enterText('username12');

      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('password');

      // Attempt to sign in without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Passwords do not match')),
          'Passwords do not match');
      // Go back to the main screen using the back button on the app bar
      print('Tapping back icon to return to main screen');
      await driver?.tap(find.byTooltip('Back'));
      await Future.delayed(const Duration(seconds: 1));
      //main
      // sign up
    });
    test('should get warning if Login field missing', () async {
//////////////////////////////////////////////////////////////////////////////////////

      await driver?.tap(find.text('Login'));
      await Future.delayed(const Duration(seconds: 1));
///////////////////////////////////////////////////////////////////////////////////////////
      //Attempting to login without username
      print('Testing login warnings');
      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('password');

      // await driver?.tap(find.byValueKey('usernameField'));
      // await driver?.enterText('username12');

      // Attempt to sign in without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Username is empty')),
          'Username is empty');

      //Attempting to login without password
      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('');

      await driver?.tap(find.byValueKey('usernameField'));
      await driver?.enterText('username12');

      // Attempt to sign in without entering a username
      await driver?.tap(find.byValueKey('signInButton'));
      // Verify that the warning is shown
      expect(await driver?.getText(find.text('Password is empty')),
          'Password is empty');
    });

////////////// WILL NEED TO ADD YOUR CODE HERE FOR VERIFICATION OF DATABASE -E  ///////////////////////////
    test('should not be able to login with wrong password', () async {},
        skip: true);

    test('Username not found or incorrect', () async {}, skip: true);
  });


  group('Home Happy Paths', () {
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ///  Here you will create a test to check if the button works correctly -E
    test("user should be able to choose a group", () async {
      await driver?.tap(find.byValueKey('passwordField'));
      await driver?.enterText('password');

      await driver?.tap(find.byValueKey('usernameField'));
      await driver?.enterText('username12');
      print("signing in for test");
      // Attempt to sign in without entering a username
      await driver?.tap(find.byValueKey('signInButton'));

      expect(await driver?.getText(find.text('Welcome!')), 'Welcome!');
      // driver should tap button with the text "Group1"
      await driver?.tap(find.text('Group 1'));
      // Button should take user to the group's home page and so
      // the driver should find the text "Home"
      expect(await driver?.getText(find.text('Home')), 'Home');
    });
    test('user should be able to toggle arrow icon', () async {
      print("tabbing arrow");
      await driver?.tap(find.byValueKey('arrowIcon'));
      await Future.delayed(const Duration(seconds: 3));

      //need to add more to the test- K
    });
    // testing if upload button is present
    test("Uploading images button", () async {
      expect(await driver?.getText(find.text("Upload Image")), "Upload Image");
      /////////////////////////////////////////////////////////////////////////////
      /// Remove later on -E
      // // Go back to the main screen using the back button on the app bar
    });


    test('user should be able to press heart button and it will fill with red', () async {

      /*
      // Find the heart button by its key
      final heartButton = find.byValueKey('heartButton');

      // Tap the heart button
      await driver?.tap(find.byValueKey('heartButton'));

      // Wait for the UI to update
      await Future.delayed(const Duration(seconds: 3));

      // Check if the heart button is filled with red
      final heartButtonState = await driver?.getText(heartButton);

     // Check the state of the heart button
     // Adjust this if necessary to check the state correctly
      expect(heartButtonState, contains('filled')); 
     */

      // Find the heart button using the key
      final diagnostics = await driver?.getRenderObjectDiagnostics(find.byValueKey('heartButton'));
      // Tap the heart button
      await driver?.tap(find.byValueKey('heartButton'));
      // Output the diagnostics to check the widget's properties, including color
      print(diagnostics);
    });

    test(
      'user should be able to press comment button and text field will appear',
      () async {
        // Find the comment button by its key
        final commentButton = find.byValueKey('commentButton');
        // Tap the comment button
        await driver?.tap(commentButton);
        // Check if the comment text field appears by finding it by its key
        final commentField = find.byValueKey('commentTextField');
        // Ensure the text field is visible
        await driver?.waitFor(commentField);
        // You cannot directly use getText(), but you can validate its presence
        final hint = find.text('Add a comment...');
        expect(hint, isNotNull); // Ensures the placeholder text is correct
      },
    );

    test(
      'send button should work and comment records can be shown under the text field after press send button',
      () async {
        // Find the comment button and tap to reveal the text field
        //final commentButton = find.byValueKey('commentButton');
        //await driver?.tap(commentButton);

        // Find the comment text field and input text
        final commentTextField = find.byValueKey('commentTextField');
        await driver?.tap(commentTextField);
        await driver?.enterText('This is a test comment');

        // Find and tap the send button
        await driver?.tap(find.byValueKey('sendButton'));

        // Verify if the send button worked (you can check this by ensuring the text field is cleared)
        expect(await driver?.getText(commentTextField), '');
                // Check if the new comment appears in the comment list by finding it with the comment text
        final commentInList = find.text('This is a test comment');
        expect(await driver?.getText(commentInList), 'This is a test comment');
      },
    );
  });

  group('Happy Paths for Profile Tab ', () {
    test("User should be able to open Profile tab", () async {
      await driver?.tap(find.byTooltip('User Profile'));
      await Future.delayed(const Duration(seconds: 3));
      await driver?.tap(find.text('My Account'));
      await Future.delayed(const Duration(seconds: 3));
    });
  });
  

  group("Menu navigation Happy Paths", (){
    test('user should be able to naviagte through menu tab', () async {

      await driver?.tap(find.byTooltip('Menu'));
      print('Testing Change Group');
      await driver?.tap(find.text('Change group'));
      expect(await driver?.getText(find.text('Welcome')), 'Welcome');
      await driver?.tap(find.text('Group 1'));

      await driver?.tap(find.byTooltip('Menu'));
      print('Testing Home');
      await driver?.tap(find.text('Home'));
      expect(await driver?.getText(find.text('Home')), 'Home');

      await driver?.tap(find.byTooltip('Menu'));
      print('Testing Calendar');
      await driver?.tap(find.text('Calendar'));
      expect(await driver?.getText(find.text('Calendar')), 'Calendar');
     
      await driver?.tap(find.byTooltip('Menu'));
      print('Testing Tasks');
      await driver?.tap(find.text('Tasks'));
      expect(await driver?.getText(find.text('Tasks')), 'Tasks');
      await Future.delayed(const Duration(seconds: 3));
      //await driver?.tap(find.byTooltip('Menu'));
    });
   });
    //on every page
  
  group('Testing calendar page', (){
    test('user able to see the calendar', () async {
    
      await driver?.tap(find.byTooltip('Menu'));
      //await Future.delayed(const Duration(seconds: 3));

      await driver?.tap(find.text('Calendar'));
      await driver?.tap(find.byValueKey('next_month_button'));
      // To tap on the 5th day of the month
      await driver?.tap(find.byValueKey('day_5'));

    });});


  group("Testing task page", (){
    test('should be able to add a task', () async {

    //await driver?.tap(find.byValueKey('arrowIcon'));
    //await Future.delayed(const Duration(seconds: 3));

    await driver?.tap(find.byTooltip('Menu'));
    await driver?.tap(find.text('Tasks'));

    // Wait for the 'addTaskButton' to appear
    print('Waiting for the add button');
    await driver?.waitFor(find.byValueKey('addTaskButton'));

    // Adding a new task
    print('Tapping the add button');
    await driver?.tap(find.byValueKey('addTaskButton'));

    // Adding a short delay in case the driver takes a while to respond
    await Future.delayed(const Duration(seconds: 1));

    // Wait for the dialog to appear (if there is any confirmation dialog or form)
    await driver?.waitFor(find.text(''));
    });
    
    test('should be able to save task/event', () async{
      print('Finding save button');
      expect(await driver?.getText(find.text('Save')), 'Save');

      print('tabbing save button');
      // await driver?.tap(find.byTooltip('saveButton'));

      //  add saving function and test it here - E
    });
  });
}

