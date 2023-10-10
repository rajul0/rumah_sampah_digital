import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/home_page.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/jual_produk/jual_produk_page.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/profil.dart';

class HomeNav extends StatefulWidget {
  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;

  void initState() {
    super.initState();
    // Initialize _selectedIndex with the passed value
  }

  final List<String> _pngIcon = [
    'assets/image/home_ic.png',
    'assets/image/sell_ic.png',
    'assets/image/profile_ic.png',
  ];

  // final List<String> _selectPngIcon = [
  //   'assets/image/select_home_ic.png',
  //   'assets/image/select_sell_ic.png',
  //   'assets/image/select_profile_ic.png',
  // ];

  final List<Widget> _widgetOptions = [
    // Add your widget options here
    HomePageABS(),
    JualProdukABS(),
    ProfilABSPage(),
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
                        _pngIcon.indexOf('assets/image/sell_ic.png')
                    ? AssetImage(
                        'assets/image/select_sell_ic.png',
                      )
                    : AssetImage(
                        'assets/image/sell_ic.png',
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
