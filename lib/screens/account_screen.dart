import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Color(0xFF019c9f), 
        borderRadius:BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(15),
        ),
      ),
    );
  }

}