import 'dart:io';
import 'dart:typed_data';
import 'package:app_swe2024/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_swe2024/models/authorization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app_swe2024/screens/menu_screen.dart';
class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0EDF2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF028090),
        title: const Text(
          "Tasks",
          style: TextStyle(
            color: Color(0xFFD0EDF2),
            fontSize: 20,
            fontFamily: "Martel",
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu, color: Color(0xFFD0EDF2)),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer using the context from Builder
              },
            );
          },
        ),
                actions: <Widget> [
          Builder (
            builder: (BuildContext context) {
              return PopupMenuButton<int>(
                color: const Color(0xFF019c9f),
                tooltip: 'User Profile',
                icon: const Icon(Icons.account_circle_rounded,
                    color: Color(0xFFD0EDF2), size: 30.0),
                onSelected: (int value) {
                  //_handleMenuAction(value, context);
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.account_circle_rounded,
                          color: Colors.black),
                        ),
                        Text(
                          'My Account',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.settings,
                          color: Colors.black)
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 3, //value will add functionality, will have to be extracted to account_screen and use onSelect
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.logout,
                          color: Colors.black)
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          
        ],
      ),
      drawer: const Drawer(
        child: MenuScreen(),
      ),
      // Button on bottom right of screen
      floatingActionButton: FloatingActionButton(
        key: const ValueKey('addTaskButton'),
        onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  content: SizedBox(
                    height: 400,
                    width: 300, 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        TextField(
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 128, 144),
                          ),
                          decoration: InputDecoration(
                            labelText: 'Task Title',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 2, 128, 144),
                              fontSize: 15,
                              fontFamily: "Martel",
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 2, 128, 144),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 2, 128, 144),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 2, 128, 144),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                );
              },
            );
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: const BorderSide(
            color:  Color(0xFF028090),
            width: 3.0,
            ),
          ),
          child: const Icon(Icons.add, color: Color(0xFF028090),),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
  }
}