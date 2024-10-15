import 'package:flutter/material.dart';
import 'package:app_swe2024/screens/login_screen.dart';
import 'package:app_swe2024/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 128, 144),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            // const SizedBox(height: 80),
            const Text("KinSocial",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontFamily: "Sansita",
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Social Calendar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "CormorantInfant",
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                navigateTo(SignUpScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 156, 159),
                minimumSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text
              ('Sign Up',
                style: TextStyle(
                  color:  Colors.white,
                  fontFamily: 'Martel',
                )
              ),
            ),
             ElevatedButton(
              onPressed: () {
                navigateTo(LoginScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 156, 159),
                minimumSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text
                ('Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Martel', 
                  )
                ),
            ),
          ],
        ),
      ),
    );
  }
  // will be used to navigate to the next page
  void navigateTo(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page)
    );
  }
}

