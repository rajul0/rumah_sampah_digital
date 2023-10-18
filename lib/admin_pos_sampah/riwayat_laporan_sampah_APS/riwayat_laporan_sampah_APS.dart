import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/home_nav_aps.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/riwayat_laporan_sampah_APS/riwayat_laporan_diterima_APS.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/riwayat_laporan_sampah_APS/riwayat_laporan_ditolak_APS.dart';

class RiwayatLaporanSampahAPSPage extends StatefulWidget {
  @override
  _RiwayatLaporanSampahAPSPageState createState() =>
      _RiwayatLaporanSampahAPSPageState();
}

class _RiwayatLaporanSampahAPSPageState
    extends State<RiwayatLaporanSampahAPSPage>
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
      backgroundColor: Color(0xFFEBF4F3),
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
            'Riwayat Laporan Pos',
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
            Tab(text: 'Selesai'),
            Tab(
              child: Text(
                'Ditolak',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
          labelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          indicator: BoxDecoration(color: Colors.white),
          indicatorColor: Color(0xFF008305),
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Menggunakan TabController
        children: [
          RiwayatLaporanDiterimaAPSPage(),
          RiwayatLaporanDitolakAPSPage(),
        ],
      ),
    );
  }
}