import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/component/pop_up_info.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/laporan_pos_APS/laporan_pos_APS.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/proses/proses_laporan.dart';

Future popUpKonfirmasiBatalLaporan(context, idLaporan) {
  /* pop up yang berfungsi untuk menanyakan menolak laporan atau batal*/
  void batalLaporan() {
    hapusLaporan(idLaporan);
    popUpBatalLaporanBerhasil(context);
    Navigator.pop(context);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => LaporanPosAPSPage()),
      ),
    );
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
              'Yakin ingin membatalkan laporan? ',
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
                    batalLaporan();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6.0,
                    backgroundColor: Color(0xFFD90000),
                  ),
                  child: Text('Yakin',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ],
        );
      });
}

Future popUpKonfirmasiBuatLaporan(context, userId, noTps, catatan, imageFile) {
  // Pop up untuk menanyakan laporan yakin telah selesai diproses
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
              'Yakin ingin membuat laporan?',
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
                    backgroundColor: Color(0xFFD90000),
                  ),
                  child: Text(
                    'Batal',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    buatLaporan(userId, noTps, catatan, imageFile);
                    popUpBerhasilBuatLaporan(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6.0,
                    backgroundColor: Color(0xFF008305),
                  ),
                  child: Text('Yakin',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ],
        );
      });
}

Future popUpBerhasilBuatLaporan(context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Berhasil',
            textAlign: TextAlign.center,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xFF008305)),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LaporanPosAPSPage()),
                    (route) => false);
              },
              child: Text("OK" ,style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      });
}
