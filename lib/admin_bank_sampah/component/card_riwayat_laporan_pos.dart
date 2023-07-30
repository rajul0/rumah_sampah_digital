import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/pop_up_konfirmasi_laporan_pos.dart';

Widget riwayatLaporanPosCard(BuildContext context, String namaDusun,
    String status, tanggalLapor, tanggalTerima) {
  return SizedBox(
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
            Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  status,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16.0),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Tanggal Lapor: ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  tanggalLapor,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  'Tanggal Terima: ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  tanggalTerima,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
