
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({ Key? key }) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  int _currentIndex = 0;

  void _handleTap(int index) {
    setState(() {
      _currentIndex = index; 
    });
  }

  final List <Widget> _navigations = const [
    Icon(Icons.explore),
    Icon(Icons.history),
    Icon(Icons.directions_bike),
    Icon(Icons.list),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigations[_currentIndex],
      appBar: AppBar(
        title: const Text('About'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _handleTap,
        // fixedColor: Colors.black45,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore), 
            label: 'Explore'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            label: 'Explore' 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My'
          ),
        ],
      ),
    );
  }
}
