import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getAllProdukMasyarakat() async {
  List hasil = [];

  // Mendapatkan referensi ke koleksi "users"
  CollectionReference users = FirebaseFirestore.instance.collection('produk');

  // Mendapatkan data dari koleksi "users"
  QuerySnapshot querySnapshot = await users.get();

  // Looping untuk mendapatkan data setiap dokumen pada querySnapshot
  querySnapshot.docs.forEach((doc) {
    var data = {};
    data['idDokumen'] = doc.id;
    data['idUser'] = doc['id_user'];
    data['jenisAkun'] = doc['jenis_akun'];
    data['namaProduk'] = doc['nama_produk'];
    data['hargaProduk'] = doc['harga_produk'];
    data['deskripsi'] = doc['deskripsi'];
    data['kategori'] = doc['kategori'];
    data['stokProduk'] = doc['stok_produk'];
    data['lokasi'] = doc['lokasi'];
    data['urlImage'] = doc['url_download'];
    data['noHpAdmin'] = doc['nomor_hp_admin'];
    hasil.add(data);
  });
  return hasil;
}
