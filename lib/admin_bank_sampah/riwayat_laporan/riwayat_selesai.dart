import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/card_riwayat_laporan_pos.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/riwayat_laporan/proses/proses_unduh_riwayat.dart';
import 'package:rumah_sampah_digital/proses/get_data.dart';
import 'package:open_file/open_file.dart';

class RiwayatDiterima extends StatefulWidget {
  const RiwayatDiterima({super.key});

  @override
  State<RiwayatDiterima> createState() => _RiwayatDiterimaState();
}

class _RiwayatDiterimaState extends State<RiwayatDiterima> {
  Future<List<dynamic>> fetchData() async {
    // Mengambil data dari firebase menggunakan fungsi dibawah, datanya yang dikembalikan sudah dirapikan

    return await getRiwayatLaporanPos('selesai');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF008305)),
                onPressed: () async {
                  final data = await getDataLaporanSelesai('selesai');
                  if (data != null) {
                    final pdf = createPdfDocument(data);
                    await savePdfToLocal(pdf);
                    print('PDF berhasil dibuat dan disimpan.');
                  }
                },
                child: Text('Unduh PDF'),
              ),
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
                              "Belum ada penjemputan yang selesai",
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Column(
                            children: List.generate(
                                items.length,
                                (index) => riwayatLaporanPosCard(
                                      context,
                                      items[index]['alamat'],
                                      items[index]['status'],
                                      items[index]['tanggal_lapor'],
                                      items[index]['tanggal_selesai'],
                                    )));
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
