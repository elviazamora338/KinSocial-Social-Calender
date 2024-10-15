// Purpose: This file is used to test the signin function in the Authorization class.
// The test will check if the username and password is empty, if the username is empty,
// if the password is empty, if the password is incorrect and if the username is not found in the database

import 'package:flutter_test/flutter_test.dart';
import 'package:app_swe2024/models/authorization.dart';

void main() {
  group('validate', (){
    // making a instance of the Authorization class
    Authorization authorization = Authorization();
    // grabbing the warnings from the Authorization class and assignning to new variable
    final warnings = authorization.warnings;

    // test to check if the username and password is empty
    test('return warning that username and password is empty', () {
      // expect the validate function to return the warning that username and password is empty
      // grabs validate function from instance of Authorization class
      expect(authorization.validate("", "",""), warnings[2]);
    });
    // test to check if the username is empty
    test('return warning that username is empty', () {
      // expect the validate function to return the warning that username is empty
      // grabs validate function from instance of Authorization class
      expect(authorization.validate("", "password", "re-entered password"), warnings[0]);
    });
    
    // test to check if the password is empty
    test('return warning if password is empty', () {
      // expect the validate function to return the warning that password is empty
      // grabs validate function from instance of Authorization class
      expect(authorization.validate("username", "", "re-entered password"), warnings[1]);
    });

    // test to check if passwords match
    test('return warning if password and re-entered password do not match', ()
    {
       // expect the validate function to return the warning that the password inputs don't match
      expect(authorization.validate("username", "password", "password12"), warnings[5]); 
    });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //  WILL NEED TO CHANGE THIS TEST WHEN CONFIRMING FROM DATABASE - E
    // the username is correct and in the database but the password is incorrect
    test('return incorrect password', (){

    // remove ",skip: true" to run the test
    },skip: true);
    
  });
  
  // WILL ALSO NEED TO CHANGE TO CHECK DATABASE - E
  // test to validate if user is found
  test('return username not found',()
  {
    // remove ",skip: true" to run the test
  },skip: true);
}
