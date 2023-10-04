import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/card_riwayat_laporan_pos.dart';
import 'package:rumah_sampah_digital/proses/get_data.dart';

class RiwayatDitolak extends StatefulWidget {
  const RiwayatDitolak({super.key});

  @override
  State<RiwayatDitolak> createState() => _RiwayatDitolakState();
}

class _RiwayatDitolakState extends State<RiwayatDitolak> {
  Future<List<dynamic>> fetchData() async {
    // Mengambil data dari firebase menggunakan fungsi dibawah, datanya yang dikembalikan sudah dirapikan

    return await getRiwayatLaporanPos('ditolak');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            children: [
              FutureBuilder<List<dynamic>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Ketika data masih dimuat, tampilkan indikator loading
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // Ketika terjadi error dalam pengambilan data
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List items = snapshot.data!;
                    return Column(
                        children: List.generate(
                            items.length,
                            (index) => riwayatLaporanPosCard(
                                  context,
                                  items[index]['alamat'],
                                  items[index]['status'],
                                  items[index]['tanggal_lapor'],
                                  items[index]['tanggal_ditolak'],
                                )));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
