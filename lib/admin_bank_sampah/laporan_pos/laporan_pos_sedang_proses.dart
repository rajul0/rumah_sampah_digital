import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/card_laporan_pos_sampah.dart';
import 'package:rumah_sampah_digital/proses/get_data.dart';

class LaporanPosSedangProsesPage extends StatefulWidget {
  const LaporanPosSedangProsesPage({super.key});

  @override
  State<LaporanPosSedangProsesPage> createState() =>
      _LaporanPosSedangProsesPageState();
}

class _LaporanPosSedangProsesPageState
    extends State<LaporanPosSedangProsesPage> {
  Future<List<dynamic>> fetchData() async {
    // Mengambil data dari firebase menggunakan fungsi dibawah, datanya yang dikembalikan sudah dirapikan
    return await getLaporanPos('proses');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 46.0, left: 20.0, right: 20.0, bottom: 84.0),
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
                    return items.isEmpty
                        ? SizedBox(
                            height: 20.0,
                            width: double.infinity,
                            child: Text(
                              "Tidak ada sampah yang sedang dijemput",
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Column(
                            children: List.generate(
                                items.length,
                                (index) => laporanPosDiprosesCard(
                                      context,
                                      items[index]['id'],
                                      items[index]['alamat'],
                                      items[index]['catatan'],
                                      items[index]['tanggal_lapor'],
                                      'assets/dummy_image/pos_sampah_a.png',
                                      items[index]['dijemput_oleh'],
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
