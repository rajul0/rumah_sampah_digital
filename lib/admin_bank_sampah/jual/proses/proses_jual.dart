import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> tambahBarangJual(
    userId, namaBarang, kategori, deskripsi, beratBarang, jenisAkun, imageFile,
    {hargaBarang = ''}) async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  var imagePath =
      await uploadGambarBarang(jenisAkun, imageFile, kategori, namaBarang);
  // Fungsi tambah barang ke database firestore firebase
  return _db.collection('barang').doc().set({
    'id_user': userId,
    'nama_barang': namaBarang,
    'harga_barang': hargaBarang,
    'kategori': kategori,
    'deskripsi': deskripsi,
    'berat_barang': beratBarang,
    'jenis_akun': jenisAkun,
    'lokasi': 'Banda Aceh',
    'url_download': imagePath,
  }).catchError((error) => print("Failed to add user: $error"));
}

Future uploadGambarBarang(
    jenisAkun, File imageFile, kategori, namaBarang) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  // Fungsi untuk mengupload gambar form ke server atau melakukan tindakan lainnya
  User? user = _auth.currentUser;
  String imagePath = '$jenisAkun/${user?.uid}/$kategori/$namaBarang.jpg';
  try {
    TaskSnapshot snapshot = await _storage.ref(imagePath).putFile(imageFile);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } on FirebaseException catch (e) {
    print(e);
  }
}
