import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/login_page.dart';

Future popUpSuccesRegistAccount(context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 26.0, vertical: 55.0),
          children: <Widget>[
            SizedBox(
              height: 54.0,
              child: Image(image: AssetImage('assets/image/centang.png')),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Hore! Daftar akun anda berhasil',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 6.0,
                backgroundColor: Color(0xFF008305),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text("Masuk"),
            ),
          ],
        );
      });
}
