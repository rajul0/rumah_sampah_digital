import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/laporan_pos/laporan_pos.dart';
import 'package:rumah_sampah_digital/proses/proses_laporan.dart';

Future prosesLaporan(context, idLaporan) {
  /*Fungsi untuk proses laporan yg dilapor oleh petugas pos.
    Meminta input nama petugas yg menjemput berupa String. Berbentuk widget pop up
  */
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _dijemputOleh = '';

  void prosesJemput() {
    ubahStatusLaporan(idLaporan, 'proses', petugas: _dijemputOleh);
    Navigator.pop(context);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => LaporanPosPage()),
      ),
    );
    popUpProsesLaporan(context);
  }

  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 28.0),
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Dijemput oleh',
                      labelStyle: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14.0,
                          fontFamily: 'Poppins'),
                      contentPadding: EdgeInsets.only(
                        top: 13.0,
                        bottom: 12.0,
                        left: 18.0,
                        right: 18.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(color: Color(0xFF008305))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(color: Color(0xFF008305)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(color: Color(0xFF008305)),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF000000),
                      fontFamily: 'Poppins',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Masukkan nama petugas';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _dijemputOleh = value!;
                    },
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 6,
                          backgroundColor: Color(0xFFD90000),
                        ),
                        child: Text(
                          'Batal',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            prosesJemput();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 6.0,
                          backgroundColor: Color(0xFF008305),
                        ),
                        child: Text('Proses'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      });
}

Future popUpProsesLaporan(context) {
  // Pop up informasi berhasil memproses laporan pos
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 28.0),
          children: <Widget>[
            SizedBox(
              height: 54.0,
              child: Image.asset(
                'assets/image/centang.png',
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              'Laporan di Proses',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 22.0,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF008305)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}

Future popUpKonfirmasiTolakLaporan(context, idLaporan) {
  /* pop up yang berfungsi untuk menanyakan menolak laporan atau batal*/
  void tolakLaporan() {
    popUpTolakLaporanBerhasil(context);
    ubahStatusLaporan(idLaporan, 'ditolak');
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => LaporanPosPage()),
        (route) => false);
  }

  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 28.0),
          children: <Widget>[
            SizedBox(
              height: 54.0,
              child: Image.asset(
                'assets/image/question_mark.png',
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              'Yakin menolak laporan? ',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 22.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6,
                    backgroundColor: Color(0xFF008305),
                  ),
                  child: Text(
                    'Batal',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    tolakLaporan();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6.0,
                    backgroundColor: Color(0xFFD90000),
                  ),
                  child: Text('Yakin'),
                ),
              ],
            ),
          ],
        );
      });
}

Future popUpTolakLaporanBerhasil(context) {
  // Pop up untuk menginformasikan bahwa berhasil menolak laporan dari petugas pos.
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 28.0),
          children: <Widget>[
            SizedBox(
              height: 54.0,
              child: Image.asset(
                'assets/image/centang.png',
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              'Laporan telah Selesai di Proses',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 22.0,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF008305)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}

Future selesaiLaporan(context, idLaporan) {
  /*Fungsi untuk proses laporan yg dilapor oleh petugas pos.
    Meminta input nama petugas yg menjemput berupa String. Berbentuk widget pop up
  */
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double? _BSO; //  Berat Sampah Organik
  double? _BSA; //  Berat Sampah anorganik

  bool _errorMessage = false;

  void laporanSelesai() {
    try {
      ubahStatusLaporan(idLaporan, 'selesai', bso: _BSO, bsa: _BSA);
      updateTotalSampah(_BSA, _BSO);
      popUpSelesaiLaporanBerhasil(context);
      Navigator.pop(context);
    } catch (e) {}
  }

  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 28.0),
          children: <Widget>[
            Form(
              key: _formKey,
              child: SizedBox(
                width: 300.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Berat sampah Organik (kg)',
                        labelStyle: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14.0,
                            fontFamily: 'Poppins'),
                        contentPadding: EdgeInsets.only(
                          top: 13.0,
                          bottom: 12.0,
                          left: 18.0,
                          right: 18.0,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                            borderSide: BorderSide(color: Color(0xFF008305))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(color: Color(0xFF008305)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(color: Color(0xFF008305)),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF000000),
                        fontFamily: 'Poppins',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan Berat sampah Organik(kg)';
                        } else if (value.contains(',')) {
                          return 'Tidak boleh menggunakan "," (koma)';
                        } else if (_errorMessage) {
                          _errorMessage = false;
                          return 'Inputan tidak valid';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _BSO = double.parse(value!);
                      },
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Berat Sampah Anorganik(kg)',
                        labelStyle: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14.0,
                            fontFamily: 'Poppins'),
                        contentPadding: EdgeInsets.only(
                          top: 13.0,
                          bottom: 12.0,
                          left: 18.0,
                          right: 18.0,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                            borderSide: BorderSide(color: Color(0xFF008305))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(color: Color(0xFF008305)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(color: Color(0xFF008305)),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF000000),
                        fontFamily: 'Poppins',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan Berat Sampah Anorganik(kg)';
                        } else if (value.contains(',')) {
                          return 'Tidak boleh menggunakan "," (koma)';
                        } else if (_errorMessage) {
                          _errorMessage = false;
                          return 'Inputan tidak valid';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _BSA = double.parse(value!);
                      },
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 6,
                            backgroundColor: Color(0xFFD90000),
                          ),
                          child: Text(
                            'Batal',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            try {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                popUpSelesaiLaporanBerhasil(context);
                                laporanSelesai();
                              }
                            } catch (e) {
                              _errorMessage = true;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 6.0,
                            backgroundColor: Color(0xFF008305),
                          ),
                          child: Text('Selesai'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      });
}

Future popUpSelesaiLaporanBerhasil(context) {
  // Pop up untuk menginformasikan bahwa berhasil menyelesaikan proses jemput laporan.

  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 28.0),
          children: <Widget>[
            SizedBox(
              height: 54.0,
              child: Image.asset(
                'assets/image/centang.png',
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              'Laporan telah Selesai di Proses',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 22.0,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF008305)),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: ((context) => LaporanPosPage()),
                    ),
                    ((route) => false));
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}

Future popUpBatalProsesLaporan(context) {
  // Pop up yang berfungsi untuk membatalkan laporan yang telah masuk tahap sedang diproses atau proses
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 28.0),
          children: <Widget>[
            SizedBox(
              height: 54.0,
              child: Image.asset(
                'assets/image/tolak_img.png',
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              'Laporan Batal di Proses',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 22.0,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF008305)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: ((context) => LaporanPosPage()),
                  ),
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}
