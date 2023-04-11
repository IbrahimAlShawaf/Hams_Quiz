import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/MyHomeScreen.dart';
import 'package:flutter_application_1/views/screens/favorite_screen.dart';
import 'package:flutter_application_1/views/screens/list_screen.dart';
import 'package:flutter_application_1/views/screens/search_screen.dart';
import 'package:flutter_application_1/views/screens/setting_screen.dart';

class MyMainScreen extends StatefulWidget {
  const MyMainScreen({super.key});

  @override
  _MyMainScreenState createState() => _MyMainScreenState();
}

class _MyMainScreenState extends State<MyMainScreen> {
  int _currentIndex = 2;

  final List<Widget> _children = [
    const ListScreen(),
    const SearchScreen(),
    MyHomeScreen(),
     FavoriteScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        //type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.blueGrey.shade200,
                size: 35,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.blueGrey.shade200,
                size: 35,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blueGrey.shade200,
                size: 35,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.blueGrey.shade200,
                size: 35,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.blueGrey.shade200,
                size: 35,
              ),
              label: ''),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
