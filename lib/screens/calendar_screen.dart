import 'dart:io';
import 'dart:typed_data';
import 'package:app_swe2024/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_swe2024/models/authorization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app_swe2024/screens/menu_screen.dart';
class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0EDF2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF028090),
        title: const Text(
          "Calendar",
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
      );
  }
}