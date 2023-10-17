import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/home_aps_page.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/profil_aps_page.dart';

class HomeNavAPS extends StatefulWidget {
  @override
  _HomeNavAPSState createState() => _HomeNavAPSState();
}

class _HomeNavAPSState extends State<HomeNavAPS> {
  int _selectedIndex = 0;

  void initState() {
    super.initState();
    // Initialize _selectedIndex with the passed value
  }

  final List<String> _pngIcon = [
    'assets/image/home_ic.png',
    'assets/image/profile_ic.png',
  ];

  // final List<String> _selectPngIcon = [
  //   'assets/image/select_home_ic.png',
  //   'assets/image/select_sell_ic.png',
  //   'assets/image/select_profile_ic.png',
  // ];

  final List<Widget> _widgetOptions = [
    // Add your widget options here
    HomePageAPS(),
    ProfilAPSPage(),
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
            icon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image(
                image: _selectedIndex ==
                        _pngIcon.indexOf('assets/image/home_ic.png')
                    ? AssetImage(
                        'assets/image/select_home_ic.png',
                      )
                    : AssetImage(
                        'assets/image/home_ic.png',
                      ),
                width: 30,
                height: 30,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image(
                image: _selectedIndex ==
                        _pngIcon.indexOf('assets/image/profile_ic.png')
                    ? AssetImage(
                        'assets/image/select_profile_ic.png',
                      )
                    : AssetImage(
                        'assets/image/profile_ic.png',
                      ),
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
