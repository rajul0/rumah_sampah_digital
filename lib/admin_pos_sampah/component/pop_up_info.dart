import 'package:flutter/material.dart';

Future popUpBatalLaporanBerhasil(context) {
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
