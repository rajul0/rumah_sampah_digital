import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/laporan_pos.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/riwayat_laporan.dart';

class HomePageABS extends StatefulWidget {
  const HomePageABS({super.key});

  @override
  State<HomePageABS> createState() => _HomePageABSState();
}

class _HomePageABSState extends State<HomePageABS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 46.0, left: 57.0, right: 57.0, bottom: 84.0),
          child: Column(
            children: [
              Text(
                'Halo, petugas',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                  height: 225,
                  width: 298,
                  child: Image(
                    image: AssetImage('assets/image/bg_home.png'),
                  )),
              SizedBox(
                height: 44.0,
              ),
              Text(
                'Laporan Hari ini:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 31,
              ),
              Text(
                '2',
                style: TextStyle(
                  color: Color(0xFF008305),
                  fontSize: 62,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                // 3 Fitur utama  disini
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LaporanPosPage()),
                      );
                    },
                    child: Container(
                      width: 55.0,
                      child: Column(
                        children: [
                          SizedBox(
                            child: Image(
                              image: AssetImage('assets/image/draft.png'),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Laporan Pos Sampah',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RiwayatLaporanPage()),
                      );
                    },
                    child: Container(
                      width: 55.0,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 46.0,
                            child: Image(
                              image: AssetImage('assets/image/riwayat.png'),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Riwayat Laporan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 47.0,
              ),
              Container(
                width: 79.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 46.0,
                      child: Image(
                        image: AssetImage('assets/image/aduan.png'),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Aduan\nMasyarakat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
