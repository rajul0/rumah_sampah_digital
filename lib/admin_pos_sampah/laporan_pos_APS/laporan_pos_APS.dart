import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/home_nav_aps.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/laporan_pos_APS/buat_laporan_aps.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/laporan_pos_APS/laporan_pos_menunggu.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/laporan_pos_APS/laporan_pos_sedang_proses.dart';

class LaporanPosAPSPage extends StatefulWidget {
  @override
  _LaporanPosAPSPageState createState() => _LaporanPosAPSPageState();
}

class _LaporanPosAPSPageState extends State<LaporanPosAPSPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi TabController dengan jumlah tab yang sesuai
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Hapus TabController saat widget di dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFEBF4F3),
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeNavAPS(),
              ),
            );
          },
          child: SizedBox(
            height: 34.0,
            width: 34.0,
            child: Image.asset('assets/image/back.png'),
          ),
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Laporan Pos Sampah',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
        ),
        bottom: TabBar(
          controller: _tabController, // Menggunakan TabController
          tabs: [
            Tab(text: 'Menunggu'),
            Tab(
              child: Text(
                'Sedang proses',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
          ],
          indicator: BoxDecoration(color: Colors.white),
          labelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          indicatorColor: Color(0xFF008305),
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Menggunakan TabController
        children: [
          LaporanPosMenungguAPSPage(),
          LaporanPosSedangProsesAPSPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            _buildPageRoute(
              BuatLaporanAPSPage(),
            ),
          );
        },
        child: Icon(Icons.add), // Menambahkan ikon plus ke tombol
        backgroundColor: Color(
            0xFF008305), // Ubah warna latar belakang tombol sesuai kebutuhan Anda
      ),
    );
  }

  Route _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
