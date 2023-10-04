import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

void ubahStatusLaporan(idLaporan, petugas, status) {
  DateTime date = DateTime.now();
  String formatedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection('laporan_pos').doc(idLaporan).update({
    'status': status,
    'dijemput_oleh': petugas,
    'tanggal_proses': formatedDate
  });
}
