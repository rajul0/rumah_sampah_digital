import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/pop_up_konfirmasi_laporan_pos.dart';
import 'package:rumah_sampah_digital/proses/proses_laporan.dart';

Widget laporanPosCard(BuildContext context, String namaDusun, String catatan,
    DateTime date, image, id) {
  // DateTime dateParse = DateFormat('yyyy-MM-dd HH:mm:ss SSS').parse(date);
  String formatedDate = DateFormat('yyyy-MM-dd').format(date);
  String formatedTime = DateFormat('HH:mm').format(date);

  return SizedBox(
    height: 372.0,
    width: double.infinity,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF53AB5A), Color(0xFF8FE3A4)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              namaDusun,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '$formatedDate / $formatedTime WIB',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              'catatan: ',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              catatan,
              textAlign: TextAlign.justify,
              style: TextStyle(),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 250.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 94.0,
                  height: 33.0,
                  child: ElevatedButton(
                    onPressed: () {
                      popUpTolakLaporan(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 0,
                      backgroundColor: Color(0xFFD90000),
                    ),
                    child: Text(
                      'Tolak',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: 94.0,
                  height: 33.0,
                  child: ElevatedButton(
                    onPressed: () {
                      prosesLaporan(context, id);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 0,
                      backgroundColor: Color(0xFF008305),
                    ),
                    child: Text(
                      'Proses',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget laporanPosDiprosesCard(BuildContext context, idLaporan, String namaDusun,
    String catatan, DateTime date, image, dijemput_oleh) {
  // DateTime dateParse = DateFormat('yyyy-MM-dd HH:mm:ss SSS').parse(date);
  String formatedDate = DateFormat('yyyy-MM-dd').format(date);
  String formatedTime = DateFormat('HH:mm').format(date);

  void batalProses() {
    ubahStatusLaporan(idLaporan, 'menunggu');
    popUpBatalProsesLaporan(context);
  }

  return SizedBox(
    height: 372.0,
    width: double.infinity,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF53AB5A), Color(0xFF8FE3A4)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              namaDusun,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '$formatedDate / $formatedTime WIB',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'di Jemput oleh: $dijemput_oleh',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 250.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 144.0,
                  height: 33.0,
                  child: ElevatedButton(
                    onPressed: () {
                      batalProses();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 0,
                      backgroundColor: Color(0xFFD90000),
                    ),
                    child: Text(
                      'Batal Proses',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: 94.0,
                  height: 33.0,
                  child: ElevatedButton(
                    onPressed: () {
                      popUpSelesaiLaporan(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 0,
                      backgroundColor: Color(0xFF008305),
                    ),
                    child: Text(
                      'Selesai',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
