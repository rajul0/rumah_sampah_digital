import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget riwayatLaporanPosCard(BuildContext context, String namaDusun,
    String status, tanggalLapor, tanggalTerimaTolak) {
  // Ubah tulisan
  var firstLetter = status[0].toUpperCase();
  var remainingLetters = status.substring(1);
  status = firstLetter + remainingLetters;

  // ubah format tanggal dan jam lapor
  DateTime dateLaporParse =
      DateFormat('yyyy-MM-dd HH:mm:ss').parse(tanggalLapor);
  String formatedLaporDate = DateFormat('yyyy-MM-dd').format(dateLaporParse);
  String formatedLaporTime = DateFormat('HH:mm').format(dateLaporParse);

  // ubah format tanggal terima
  DateTime dateTerimaTolakParse =
      DateFormat('yyyy-MM-dd HH:mm:ss').parse(tanggalTerimaTolak);
  String formatedTerimaTolakDate =
      DateFormat('yyyy-MM-dd').format(dateTerimaTolakParse);
  String formatedTerimaTolakTime =
      DateFormat('HH:mm').format(dateTerimaTolakParse);

  return SizedBox(
    width: double.infinity,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              border: Border.all(color: Colors.green)),
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
                      '$formatedLaporDate / $formatedLaporTime',
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
                      'Tanggal $status: ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '$formatedTerimaTolakDate / $formatedTerimaTolakTime',
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
        SizedBox(
          height: 10.0,
        )
      ],
    ),
  );
}
