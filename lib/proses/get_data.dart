import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<dynamic> getDataUser() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  String? _userId = user?.uid;

  var userData = {};
  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users = FirebaseFirestore.instance.collection('akun');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot =
      await users.where('uid', isEqualTo: _userId).get();

  // Looping untuk mendapatkan data setiap dokumen pada querySnapshot
  querySnapshot.docs.forEach((doc) {
    userData['nama'] = doc['nama'];
    userData['no_hp'] = doc['no_hp'];
    userData['uid'] = doc['uid'];
    userData['role'] = doc['role'];
  });
  return userData;
}

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

Future<List> getAllProduk() async {
  List hasil = [];

  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users = FirebaseFirestore.instance.collection('produk');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot = await users.get();

  // Looping untuk mendapatkan data setiap dokumen pada querySnapshot
  querySnapshot.docs.forEach((doc) {
    var data = {};
    data['idDokumen'] = doc.id;
    data['namaProduk'] = doc['nama_produk'];
    data['hargaProduk'] = doc['harga_produk'];
    data['idUser'] = doc['id_user'];
    data['jenisAkun'] = doc['jenis_akun'];
    data['kategori'] = doc['kategori'];
    data['lokasi'] = doc['lokasi'];
    data['urlImage'] = doc['url_download'];
    hasil.add(data);
  });
  return hasil;
}

// data['idDokumen'] = doc.id;
//     data['namaProduk'] = doc['nama_produk'];
//     data['hargaProduk'] = doc['harga_produk'];
//     data['deskripsi'] = doc['deskripsi'];
//     data['berat_produk'] = doc['berat_produk'];
//     data['idUser'] = doc['id_user'];
//     data['jasaPengiriman'] = doc['jasa_pengiriman'];
//     data['jenisAkun'] = doc['jenis_akun'];
//     data['kategori'] = doc['kategori'];
//     data['lokasi'] = doc['lokasi'];
//     data['metodePembayaran'] = doc['metode_pembayaran'];
//     data['urlDownload'] = doc['url_download'];