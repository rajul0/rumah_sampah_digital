import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> hapusLaporan(idProduk) async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  try {
    await _db.collection('laporan_pos').doc(idProduk).delete();
  } catch (e) {}
}

Future<void> buatLaporan(
  userId,
  noTps,
  catatan,
  imageFile,
) async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;

  // data date
  DateTime date = DateTime.now();
  String formattedDateTime = date.toString();

  var imagePath = await uploadGambarLaporan(
    'Admin Pos Sampah',
    imageFile,
    noTps,
  );
  // Fungsi tambah barang ke database firestore firebase
  return _db.collection('laporan_pos').doc().set({
    'id_pelapor': userId,
    'pelapor': user?.displayName,
    'alamat': 'TPS $noTps',
    'catatan': catatan,
    'tanggal_lapor': formattedDateTime,
    'status': 'menunggu',
    'img_path': imagePath,
  }).catchError((error) => error);
}

Future uploadGambarLaporan(jenisAkun, File imageFile, noTps) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  DateTime date = DateTime.now();
  var tanggal = date.day;
  var bulan = date.month;
  var tahun = date.year;

  // Fungsi untuk mengupload gambar form ke server atau melakukan tindakan lainnya
  User? user = _auth.currentUser;
  String imagePath =
      '$jenisAkun/${user?.uid}/TPS$noTps/$tanggal$bulan$tahun.jpg';
  try {
    TaskSnapshot snapshot = await _storage.ref(imagePath).putFile(imageFile);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } on FirebaseException catch (e) {}
}
