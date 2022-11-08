import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:miit_app/pages/profile.dart';
import 'package:miit_app/widgets/search.dart';
import 'package:miit_app/widgets/task.dart';
import 'package:miit_app/widgets/week.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = <Widget>[
    WeekPage(),
    TaskPage(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue.shade700,
        selectedItemColor: Colors.blue.shade700,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.blue.shade700,
            ),
            label: 'Рассписание',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task,
              color: Colors.blue.shade700,
            ),
            label: 'Задания',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.blue.shade700,
            ),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
