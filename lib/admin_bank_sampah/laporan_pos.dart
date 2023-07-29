import 'package:flutter/material.dart';

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
                  mainAxisAlignment: MainAxisAlignment.start,
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
            ],
          ),
        ),
      ),
    );
  }
}
