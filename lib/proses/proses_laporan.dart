import 'package:cloud_firestore/cloud_firestore.dart';

void ubahStatusLaporan(idLaporan, status, {petugas}) {
  DateTime date = DateTime.now();
  String formatedDate = date.toString();
  FirebaseFirestore db = FirebaseFirestore.instance;

  if (status == 'proses') {
    db.collection('laporan_pos').doc(idLaporan).update({
      'status': status,
      'dijemput_oleh': petugas,
      'tanggal_proses': formatedDate
    });
  } else if (status == 'menunggu') {
    db.collection('laporan_pos').doc(idLaporan).update({
      'status': status,
      'dijemput_oleh': FieldValue.delete(),
      'tanggal_proses': FieldValue.delete(),
    });
  } else if (status == 'ditolak') {
    db.collection('laporan_pos').doc(idLaporan).update({
      'status': status,
      'tanggal_ditolak': formatedDate,
      'dijemput_oleh': FieldValue.delete(),
      'tanggal_proses': FieldValue.delete(),
    });
  }
}
