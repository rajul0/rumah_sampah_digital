import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/home_nav.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/laporan_pos/laporan_pos_menunggu.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/laporan_pos/laporan_pos_sedang_proses.dart';

class LaporanPosPage extends StatefulWidget {
  @override
  _LaporanPosPageState createState() => _LaporanPosPageState();
}

class _LaporanPosPageState extends State<LaporanPosPage>
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
                builder: (context) => HomeNav(),
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
            'Laporan Pos',
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
          LaporanPosMenungguPage(),
          LaporanPosSedangProsesPage(),
        ],
      ),
    );
  }
}
