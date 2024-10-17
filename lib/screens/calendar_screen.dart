import 'dart:io';
import 'dart:typed_data';
import 'package:app_swe2024/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_swe2024/models/authorization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app_swe2024/screens/menu_screen.dart';
import 'package:intl/intl.dart'; // Add intl package for date formatting

//******
// Just option:
// If the app will handle events, separate concerns by adding these files:
//    1. calendar_event.dart: To define an event class (title, date, description).
//    2. event_service.dart: To manage event logic,
//        like adding and retrieving events for specific dates.*/

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now(); // Track the selected date
  DateTime _focusedDate = DateTime.now(); // Track the current displayed month

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
                Scaffold.of(context)
                    .openDrawer(); // Opens the drawer using the correct context
              },
            );
          },
        ),
        actions: <Widget>[
          PopupMenuButton<int>(
            key: const Key('profile_menu'),  // Added key for profile menu
            color: const Color(0xFF019c9f),
            tooltip: 'User Profile',
            icon: const Icon(Icons.account_circle_rounded,
                color: Color(0xFFD0EDF2), size: 30.0),
            onSelected: (int value) {
              // Handle menu action
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
                    Text('My Account', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.settings, color: Colors.black),
                    ),
                    Text('Settings', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.logout, color: Colors.black),
                    ),
                    Text('Logout', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const Drawer(
        child: MenuScreen(),
      ),
      body: Column(
        children: [
          // Month and Year Display
          _buildHeader(),

          // Days of Week Display
          _buildDaysOfWeek(),

          // Calendar grid with dates
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  // Header to display current month and year
  Widget _buildHeader() {
    String month = DateFormat.yMMMM().format(_focusedDate);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            // Added key for previous button
            key: const Key('previous_month_button'),
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _focusedDate =
                    DateTime(_focusedDate.year, _focusedDate.month - 1);
              });
            },
          ),
          Text(
            month,
            key: const Key('month_display'),  // Added key for month display
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            key: const Key('next_month_button'),  // Added key for next button
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _focusedDate =
                    DateTime(_focusedDate.year, _focusedDate.month + 1);
              });
            },
          ),
        ],
      ),
    );
  }

  // Days of the week row
  Widget _buildDaysOfWeek() {
    List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: daysOfWeek
          .map((day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    key: Key('day_$day'),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ))
          .toList(),
    );
  }

  // Calendar GridView to display dates
  Widget _buildCalendarGrid() {
    final daysInMonth =
        DateUtils.getDaysInMonth(_focusedDate.year, _focusedDate.month);
    final firstDayOfWeek =
        DateTime(_focusedDate.year, _focusedDate.month, 1).weekday;

    List<Widget> dayWidgets = [];

    // Add padding for days before the 1st of the month
    for (int i = 1; i < firstDayOfWeek; i++) {
      dayWidgets.add(Expanded(child: Container()));
    }

    // Add all the days of the current month
    for (int day = 1; day <= daysInMonth; day++) {
      dayWidgets.add(
        GestureDetector(
          // Added key for each day in the grid
          key: Key('day_$day'),
          onTap: () {
            setState(() {
              _selectedDate =
                  DateTime(_focusedDate.year, _focusedDate.month, day);
            });
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: _selectedDate.day == day &&
                      _selectedDate.month == _focusedDate.month
                  ? Colors.blueAccent
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                '$day',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: GridView.count(
        crossAxisCount: 7,
        children: dayWidgets,
      ),
    );
  }
}
