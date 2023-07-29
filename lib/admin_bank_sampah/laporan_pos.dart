import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/component/card_laporan_pos_sampah.dart';

class LaporanPosPage extends StatefulWidget {
  const LaporanPosPage({super.key});

  @override
  State<LaporanPosPage> createState() => _LaporanPosPageState();
}

class _LaporanPosPageState extends State<LaporanPosPage> {
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
                        'Laporan Pos',
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
              laporanPosCard(
                  context,
                  'Dusun A',
                  'Sampah Sudah penuh, dapat dijemput',
                  'assets/dummy_image/pos_sampah_a.png'),
              SizedBox(
                height: 33.0,
              ),
              laporanPosCard(
                  context,
                  'Dusun B',
                  'Sampah Sudah penuh, dapat dijemput',
                  'assets/dummy_image/pos_sampah_a.png')
            ],
          ),
        ),
      ),
    );
  }
}
