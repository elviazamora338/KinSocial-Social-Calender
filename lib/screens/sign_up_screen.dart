import 'package:flutter/material.dart';
import 'package:app_swe2024/models/authorization.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Instance of the Authorization class
  final authorization = Authorization();

  // Text controllers for the username and passwords fields
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reEnterPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 208, 237, 242),
          ),
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ), 
        title: const Text("Sign Up",
          style: TextStyle(
            color: Color.fromARGB(255, 208, 237, 242),
            fontSize: 20,
            fontFamily: "Martel",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 128, 144),
      ), 
      backgroundColor: const Color.fromARGB(255, 208, 237, 242),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 35,
              color:  Color.fromARGB(255, 2, 128, 144),
              fontFamily: "Sansita",

            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Form(
              child: Column(
                children: [
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                       // added for testing purposes
                      key: const Key('usernameField'),
                      // to store the input of the field username
                      controller: _usernameController,
                      style: const TextStyle(color: Color.fromARGB(255, 2, 128, 144)),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle (
                          color: Color.fromARGB(255, 2, 128, 144),
                          fontFamily:"Martel",
                          fontSize: 15.0,
                        ),
                        hintText: 'Enter Username',
                        hintStyle: const TextStyle (
                          color:  Color.fromARGB(255, 2, 128, 144),
                          fontFamily:"Martel",
                          fontSize: 15.0,
                        ),
                        prefixIcon: const Icon(Icons.perm_identity, color: Color.fromARGB(255, 2, 128, 144)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 2, 128, 144)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 2, 128, 144),
                          ),

                        ),
                      ),
                      
                      onChanged: (String value) {
                          
                      },
                      // validator: (value) {
                      //   return value!.isEmpty ? 'Please enter an email' : null;
                      // },
                    ),
                  ),
            
                  //add some space between input fields
                  const SizedBox(height: 15.0),
            
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                       // added for testing purposes
                      key: const Key('passwordField'),
                      // to store the input of the field password
                      controller: _passwordController,
                      style: const TextStyle(color: Color.fromARGB(255, 2, 128, 144)),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle (
                          color: Color.fromARGB(255, 2, 128, 144),
                          fontFamily:"Martel",
                          fontSize: 15.0,
                        ),
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle (
                          color:  Color.fromARGB(255, 2, 128, 144),
                          fontFamily:"Martel",
                          fontSize: 15.0,
                        ),
                        prefixIcon: const Icon(Icons.password, color: Color.fromARGB(255, 2, 128, 144)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 2, 128, 144)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 2, 128, 144),
                          ),

                        ),
                      ),
                      
                      onChanged: (String value) {
                          //stores input of field 'Password'
                      },
                      // validator: (value) {
                      //   return value!.isEmpty ? 'Please enter a password' : null;
                      // },
                    ),
                  ),
            
                  //add some space between input fields
                  const SizedBox(height: 15.0),
            
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      // added for testing purposes
                      key: const Key('re-enterpasswordField'),
                      // to store the input of the field password
                      controller: _reEnterPasswordController,
                      style: const TextStyle(color: Color.fromARGB(255, 2, 128, 144)),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Re-Enter Password',
                        labelStyle: const TextStyle (
                          color: Color.fromARGB(255, 2, 128, 144),
                          fontFamily:"Martel",
                          fontSize: 15.0,
                        ),
                        hintText: 'Re-Enter Password',
                        hintStyle: const TextStyle (
                          color:  Color.fromARGB(255, 2, 128, 144),
                          fontFamily:"Martel",
                          fontSize: 15.0,
                        ),
                        prefixIcon: const Icon(Icons.password, color: Color.fromARGB(255, 2, 128, 144)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 2, 128, 144)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 2, 128, 144),
                          ),

                        ),
                      ),
                      
                      onChanged: (String value) {
                          //stores input of field 'Password'
                      },
                      // validator: (value) {
                      //   return value!.isEmpty ? 'Please enter a password' : null;
                      // },
                    ),
                  ),

                  const SizedBox(height: 15.0),

                  Padding(
                    key: const Key('signInButton'),
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        authorization.signIn(context, _usernameController, _passwordController, _reEnterPasswordController);
                      },
                      color:const Color.fromARGB(255, 1, 156, 159),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: 
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontFamily: "Martel",
                          ),
                        ),
                    ),
                  ),
                ],
            
              )
            ,),
          )

        ],

      ),
    );
  }
}