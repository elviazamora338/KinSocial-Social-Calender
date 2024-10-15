import 'package:app_swe2024/screens/calendar_screen.dart';
import 'package:app_swe2024/screens/home_screen.dart';
import 'package:app_swe2024/screens/tasks_screen.dart';
import 'package:app_swe2024/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // Adjust the height as needed
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Color(0xFF019c9f), 
        borderRadius:BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const SizedBox(height: 60),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.black),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month, color: Colors.black),
            title: const Text(
              'Calendar',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.task, color: Colors.black),
            title: const Text(
              'Tasks',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle navigation to Tasks
              Navigator.push(context, MaterialPageRoute(builder: (context) => TasksScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.black),
            title: const Text(
              'Change group',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle navigation to Tasks
              Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
          ),

        ],
      ),
    );
  }
 
}
