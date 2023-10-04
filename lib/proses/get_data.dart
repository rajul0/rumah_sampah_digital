import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getLaporanPos(status) async {
  List hasil = [];
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users =
      FirebaseFirestore.instance.collection('laporan_pos');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot =
      await users.where('status', isEqualTo: status).get();

  // Looping untuk mendapatkan data setiap dokumen pada querySnapshot
  querySnapshot.docs.forEach((doc) {
    var data = {};
    data['alamat'] = doc['alamat'];
    data['pelapor'] = doc['pelapor'];
    data['status'] = doc['status'];
    data['catatan'] = doc['catatan'];
    data['imgPath'] = doc['img_path'];
    data['tanggal_lapor'] = doc['tanggal_lapor'];
    data['id'] = doc.id;

    if (data['status'] == 'proses') {
      data['dijemput_oleh'] = doc['dijemput_oleh'];
      data['tanggal_proses'] = doc['tanggal_proses'];
    }

    hasil.add(data);
  });
  return hasil;
}

Future<List> getRiwayatLaporanPos(status) async {
  List hasil = [];
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users =
      FirebaseFirestore.instance.collection('laporan_pos');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot =
      await users.where('status', isEqualTo: status).get();

  // Looping untuk mendapatkan data setiap dokumen pada querySnapshot
  querySnapshot.docs.forEach((doc) {
    var data = {};
    data['alamat'] = doc['alamat'];
    data['pelapor'] = doc['pelapor'];
    data['status'] = doc['status'];
    data['catatan'] = doc['catatan'];
    data['imgPath'] = doc['img_path'];
    data['tanggal_lapor'] = doc['tanggal_lapor'];
    data['tanggal_$status'] = doc['tanggal_$status'];
    data['id'] = doc.id;
    hasil.add(data);
  });
  return hasil;
}
