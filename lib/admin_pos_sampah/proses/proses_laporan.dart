import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> hapusLaporan(idProduk) async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  try {
    await _db.collection('laporan').doc(idProduk).delete();
  } catch (e) {
    print('Error saat menghapus dokumen: $e');
  }
}
