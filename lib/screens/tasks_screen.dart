import 'package:flutter/material.dart';
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
                    child: Center(
                      child: Text(''), // Empty for now, will be modify to add title, date & task
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