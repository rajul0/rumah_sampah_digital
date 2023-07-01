import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/home_page.dart';
import 'package:rumah_sampah_digital/on_develop_page.dart';

class HomeNav extends StatefulWidget {
  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;

  final List<String> _pngIcon = [
    'assets/image/home_ic.png',
    'assets/image/sell_ic.png',
    'assets/image/profile_ic.png',
  ];

  final List<Widget> _widgetOptions = [
    // Add your widget options here
    HomePageABS(),
    OnDevelopPage(),
    OnDevelopPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFE0EBEA),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image(
              image: AssetImage(
                'assets/image/home_ic.png',
              ),
              width: 30,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image(
              image: AssetImage(
                'assets/image/sell_ic.png',
              ),
              width: 30,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image(
              image: AssetImage(
                'assets/image/profile_ic.png',
              ),
              width: 30,
              height: 30,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
