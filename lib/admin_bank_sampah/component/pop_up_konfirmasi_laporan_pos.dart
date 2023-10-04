import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/proses/proses_laporan.dart';

Future prosesLaporan(context, idLaporan) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _dijemputOleh = '';

  void prosesJemput() {
    ubahStatusLaporan(idLaporan, _dijemputOleh, 'proses');
    Navigator.pop(context);
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
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF0095DA)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}

Future popUpTolakLaporan(context) {
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
              'Laporan di Tolak',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 22.0,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF0095DA)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}

Future popUpSelesaiLaporan(context) {
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
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF0095DA)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}

Future popUpBatalProsesLaporan(context) {
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
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF0095DA)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}
