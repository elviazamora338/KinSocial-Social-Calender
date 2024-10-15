import 'package:flutter/material.dart';
import 'package:app_swe2024/screens/sign_in_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
     var duration = const Duration(seconds: 5);
     return Timer(duration, navigateToDeviceScreen);
  }
  navigateToDeviceScreen() {
  Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }
        
@override
 Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 128, 144),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            Text("KinSocial",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontFamily: "Sansita",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Social Calendar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "CormorantInfant",
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
