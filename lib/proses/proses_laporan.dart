import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rumah_sampah_digital/masyarakat/proses/get_data.dart';

void ubahStatusLaporan(idLaporan, status, {petugas, bsa, bso}) {
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
      // 'tanggal_proses': FieldValue.delete(),
    });
  } else if (status == 'selesai') {
    db.collection('laporan_pos').doc(idLaporan).update({
      'status': status,
      'tanggal_selesai': formatedDate,
      'berat_sampah_organik': bso,
      'berat_sampah_anorganik': bsa,
    });
  }
}

void updateTotalSampah(bsa, bso) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  var data = await getDataSampah();
  var bsoSekarang = data?[0]['total_sampah_organik'];
  var bsaSekarang = data?[0]['total_sampah_anorganik'];

  db.collection('berat_sampah').doc('WZawIJ6Jfpi1gjD1fvkx').update({
    'total_sampah_organik': bsoSekarang + bso,
    'total_sampah_anorganik': bsaSekarang + bsa,
  });
}
