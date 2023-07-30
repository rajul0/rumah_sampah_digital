import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/card_laporan_pos_sampah.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/card_riwayat_laporan_pos.dart';

class RiwayatLaporanPage extends StatefulWidget {
  const RiwayatLaporanPage({super.key});

  @override
  State<RiwayatLaporanPage> createState() => _RiwayatLaporanPageState();
}

class _RiwayatLaporanPageState extends State<RiwayatLaporanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 46.0, left: 20.0, right: 20.0, bottom: 84.0),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 34.0,
                        width: 34.0,
                        child: Image.asset('assets/image/back.png'),
                      ),
                    ),
                    Align(
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
                    SizedBox(
                      height: 7,
                    ),
                  ]),
              SizedBox(
                height: 33.0,
              ),
              riwayatLaporanPosCard(
                  context, 'Dusun A', 'Terima', '29 Juli 2023', '30 Juli 2023'),
              SizedBox(
                height: 20.0,
              ),
              riwayatLaporanPosCard(
                  context, 'Dusun B', 'Ditolak', '27 Juli 2023', '-')
            ],
          ),
        ),
      ),
    );
  }
}
