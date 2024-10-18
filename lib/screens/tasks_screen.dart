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
  DateTime selectedDate = DateTime.now(); // Track current date
  List<Map<String, String>> tasks = []; // Task list

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
                Scaffold.of(context)
                    .openDrawer(); // Open the drawer using the context from Builder
              },
            );
          },
        ),
        actions: <Widget>[
          Builder(
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
                            child: Icon(Icons.settings, color: Colors.black)),
                        Text(
                          'Settings',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value:
                        3, //value will add functionality, will have to be extracted to account_screen and use onSelect
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.logout, color: Colors.black)),
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

      body: Column(
        children: [
          Expanded(
            child: Container(), // Placeholder for task content
          ),
          // Center the arrows at the bottom
          Padding(
            padding:
                const EdgeInsets.only(bottom: 20), // Adjusted bottom padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the arrows
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF028090),
                    size: 50, // Icon size
                  ),
                  onPressed: () {
                    // Action for back arrow
                  },
                ),
                const SizedBox(width: 20), // Space between arrows
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF028090),
                    size: 50, // Icon size
                  ),
                  onPressed: () {
                    // Action for forward arrow
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      //to add tasks
      floatingActionButton: FloatingActionButton(
        key: const ValueKey('addTaskButton'),
        onPressed: () {

  /*
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
                    )*/

          //variables for editing text
          TextEditingController titleController = TextEditingController();
          TextEditingController locationController = TextEditingController();
          TextEditingController dateController = TextEditingController();
          TextEditingController timeController = TextEditingController();
          TextEditingController noteController = TextEditingController();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: SizedBox(
                  height: 400,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //all your text inputs are in here
                      // Title TextField
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: "Title",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 1, 156, 159),
                            fontSize: 15,
                            fontFamily: "Martel",
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15), // Spacing between fields

                      // Location TextField
                      TextField(
                        controller: locationController,
                        decoration: const InputDecoration(
                          labelText: "Location",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 1, 156, 159),
                            fontSize: 15,
                            fontFamily: "Martel",
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Date TextField
                      TextField(
                        controller: dateController,
                        decoration: const InputDecoration(
                          labelText: "Date",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 1, 156, 159),
                            fontSize: 15,
                            fontFamily: "Martel",
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Time TextField
                      TextField(
                        controller: timeController,
                        decoration: const InputDecoration(
                          labelText: "Time",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 1, 156, 159),
                            fontSize: 15,
                            fontFamily: "Martel",
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      //note textfield
                      TextField(
                        controller: noteController,
                        decoration: const InputDecoration(
                          labelText: "Note",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 1, 156, 159),
                            fontSize: 15,
                            fontFamily: "Martel",
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      ElevatedButton(
                        key: const Key('saveButton'),
                        onPressed: () {
                          // should save
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 1, 156, 159),
                          // minimumSize: const Size(200, 40),
                          minimumSize: const Size(300, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "Martel",
                          ),
                        ),
                      ),
                    ],
                  ),
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
            color: Color(0xFF028090),
            width: 3.0,
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Color(0xFF028090),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // FAB on the right
    );
  }
}
