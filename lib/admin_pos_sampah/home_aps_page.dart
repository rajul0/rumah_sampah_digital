import 'package:flutter/material.dart';

class HomePageAPS extends StatefulWidget {
  const HomePageAPS({super.key});

  @override
  State<HomePageAPS> createState() => _HomePageAPSState();
}

class _HomePageAPSState extends State<HomePageAPS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 46.0, left: 57.0, right: 57.0, bottom: 84.0),
          child: Column(
            children: [
              Text(
                'Halo, Admin Pos Sampah',
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
                '',
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => LaporanPosPage()),
                      // );
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => RiwayatLaporanPage()),
                      // );
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
              // Container(
              //   width: 79.0,
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: 46.0,
              //         child: Image(
              //           image: AssetImage('assets/image/aduan.png'),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 5.0,
              //       ),
              //       Text(
              //         'Aduan\nMasyarakat',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //             fontSize: 12.0, fontWeight: FontWeight.w600),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
