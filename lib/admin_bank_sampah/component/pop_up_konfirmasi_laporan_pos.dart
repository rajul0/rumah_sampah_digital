import 'package:flutter/material.dart';

Future popUpTerimaLaporan(context) {
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
              'Laporan Diterima',
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
              'Laporan Ditolak',
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
