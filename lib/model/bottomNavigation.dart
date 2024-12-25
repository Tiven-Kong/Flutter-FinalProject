import 'package:bookstore_api/View/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:bookstore_api/model/favorith.dart';

class MyBottomNavigationBarPage extends StatefulWidget {
  @override
  _MyBottomNavigationBarPageState createState() =>
      _MyBottomNavigationBarPageState();
}

class _MyBottomNavigationBarPageState
    extends State<MyBottomNavigationBarPage> {
  // To keep track of the selected tab
  int _selectedIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    Center(child: Homepage()),
    Center(child: Homepage()),
    Center(child: Text('Profile Page')),
  ];

  // Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}



