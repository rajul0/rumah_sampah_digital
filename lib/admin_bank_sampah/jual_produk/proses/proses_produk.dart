import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> tambahProdukJual(
  userId,
  namaProduk,
  hargaProduk,
  kategori,
  deskripsi,
  beratProduk,
  stokProduk,
  jenisAkun,
  imageFile,
) async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  var imagePath =
      await uploadGambarBarang(jenisAkun, imageFile, kategori, namaProduk);
  // Fungsi tambah barang ke database firestore firebase
  return _db.collection('produk').doc().set({
    'id_user': userId,
    'nama_produk': namaProduk,
    'harga_produk': hargaProduk,
    'kategori': kategori,
    'deskripsi': deskripsi,
    'berat_produk': beratProduk,
    'stok_produk': stokProduk,
    'jenis_akun': jenisAkun,
    'lokasi': 'Desa Puloet',
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

Future<void> editProdukJual(
  idProduk,
  userId,
  namaProduk,
  hargaProduk,
  kategori,
  deskripsi,
  beratProduk,
  stokProduk,
  jenisAkun,
  imageFile,
) async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  if (imageFile != null) {
    var imagePath =
        await uploadGambarBarang(jenisAkun, imageFile, kategori, namaProduk);
    _db.collection('produk').doc(idProduk).update({
      'url_download': imagePath,
    });
  }

  // Fungsi tambah barang ke database firestore firebase
  return _db.collection('produk').doc(idProduk).update({
    'id_user': userId,
    'nama_produk': namaProduk,
    'harga_produk': hargaProduk,
    'kategori': kategori,
    'deskripsi': deskripsi,
    'berat_produk': beratProduk,
    'stok_produk': stokProduk,
    'jenis_akun': jenisAkun,
    'lokasi': 'Desa Puloet',
  }).catchError((error) => print("Failed to add user: $error"));
}

Future<void> deleteProduk(idProduk) async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  try {
    await _db.collection('produk').doc(idProduk).delete();
    print('Dokumen berhasil dihapus');
  } catch (e) {
    print('Error saat menghapus dokumen: $e');
  }
}
