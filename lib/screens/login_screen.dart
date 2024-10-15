import 'package:flutter/material.dart';
import 'package:app_swe2024/models/authorization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
  final Authorization authorization = Authorization();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 208, 237, 242),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ), 
        title: const Text("Login",
          style: TextStyle(
            color: Color.fromARGB(255, 208, 237, 242),
            fontSize: 20,
            fontFamily: "Martel",
          ),
        ),
      backgroundColor: const Color.fromARGB(255, 2, 128, 144),
      ), 
      backgroundColor: const Color.fromARGB(255, 208, 237, 242),
      body: Center(
        child: Column(
          // making sure it's in the center of screen
          mainAxisAlignment: MainAxisAlignment.center,
          // children of the column
          children: 
          [
            // the text title is login
            const Text("Login",
              textAlign: TextAlign.left,
              style: TextStyle(
                color:  Color.fromARGB(255, 2, 128, 144),
                fontSize: 35,
                fontFamily: "Sansita",
              ),
            ),
            // some spacing
            const SizedBox(height: 20),
           
              // the children of the container
            Column(
              children: [
                // the listtile for the username
                ListTile(
                  title: TextField(
                    // adding key for tests
                    key: const Key('usernameField'),
                    controller: _usernameController,
                    style: const TextStyle(
                      // color changes when entering text
                      color: Color.fromARGB(255, 2, 128, 144),
                    ),
                    decoration: const InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 1, 156, 159),
                        fontSize: 15,
                        fontFamily: "Martel",
                      ),
                      prefixIcon: Icon(Icons.perm_identity,
                        color: Color.fromARGB(255, 1, 156, 159),
                      ),
                      hintText: "Enter Username",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 1, 156, 159),
                        fontSize: 15,
                        fontFamily: "Martel",
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 1, 156, 159),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 1, 156, 159),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 2, 128, 144),
                        ),
                      ),
                    ),
                  ),
                ),
              

                // the listtile for the password
                ListTile(
                  title: TextField(
                    // added for testing purposes
                    key: const Key('passwordField'),
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(
                      // color changes when inputting text
                      color: Color.fromARGB(255, 2, 128, 144),
                    ),
                    decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 1, 156, 159),
                        fontSize: 15,
                        fontFamily: "Martel",
                      ),
                      prefixIcon: Icon(Icons.password,
                        color: Color.fromARGB(255, 1, 156, 159),
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 1, 156, 159),
                        fontSize: 15,
                        fontFamily: "Martel",
                      ),
                      // the border of the textfield
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          // color of the border
                          color: Color.fromARGB(255, 1, 156, 159), 
                        ),
                      ),
                      // when the textfield is enabled
                      enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          // Border color when enabled
                          color: Color.fromARGB(255, 1, 156, 159), 
                        ),
                      ),
                      // when the textfield is focused
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          // Border color when focused
                          color: Color.fromARGB(255, 2, 128, 144), 
                        ),
                      ),
                    ),
                  ),
                ),
                // some spacing
                const SizedBox(
                  height:20,
                ),
                // the login button
                ElevatedButton(
                  key: const Key('signInButton'),
                  onPressed: () {
                    authorization.signIn(context, _usernameController, _passwordController, null);
                  },
                  // changing the sttyle of the button
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 1, 156, 159),
                    // minimumSize: const Size(200, 40),
                    minimumSize: const Size(300, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: "Martel",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
 
}