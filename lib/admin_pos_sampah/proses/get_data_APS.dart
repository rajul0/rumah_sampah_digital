import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List> getRiwayatLaporanSatuUser(status) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  String? _userId = user?.uid;

  List hasil = [];
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users =
      FirebaseFirestore.instance.collection('laporan_pos');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot = await users
      .where('status', isEqualTo: status)
      .where('id_pelapor', isEqualTo: _userId)
      .get();

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

Future<List> getLaporanSatuUser(status) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  String? _userId = user?.uid;

  List hasil = [];
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users =
      FirebaseFirestore.instance.collection('laporan_pos');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot = await users
      .where('status', isEqualTo: status)
      .where('id_pelapor', isEqualTo: _userId)
      .get();

  // Looping untuk mendapatkan data setiap dokumen pada querySnapshot
  querySnapshot.docs.forEach((doc) {
    var data = {};
    data['alamat'] = doc['alamat'];
    data['pelapor'] = doc['pelapor'];
    data['status'] = doc['status'];
    data['catatan'] = doc['catatan'];
    data['imgPath'] = doc['img_path'];
    data['tanggal_lapor'] = DateTime.parse(doc['tanggal_lapor']);
    data['id'] = doc.id;

    if (data['status'] == 'proses') {
      data['dijemput_oleh'] = doc['dijemput_oleh'];
      data['tanggal_proses'] = doc['tanggal_proses'];
    }

    hasil.add(data);
  });
  return hasil;
}

Future<List<Map<String, dynamic>>?> getDataLaporanSelesaiAPS(status) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  String? _userId = user?.uid;

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('laporan_pos')
        .where("status", isEqualTo: status)
        .where('id_pelapor', isEqualTo: _userId)
        .get();
    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    return data;
  } catch (e) {
    // print('Error saat mengambil data dari Firestore: $e');
    return null;
  }
}

Future<dynamic> getDataPelapor(uid) async {
  var userData = {};
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users = FirebaseFirestore.instance.collection('akun');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot = await users.where('uid', isEqualTo: uid).get();

  // Looping untuk mendapatkan data setiap dokumen pada querySnapshot
  querySnapshot.docs.forEach((doc) {
    userData['nama'] = doc['nama'];
    userData['no_hp'] = doc['no_hp'];
    userData['uid'] = doc['uid'];
    userData['role'] = doc['role'];
  });
  return userData;
}
