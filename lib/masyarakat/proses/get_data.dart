import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>?> getAllProdukMasyarakat() async {
  try {
    // Mendapatkan referensi ke koleksi "users"
    CollectionReference users = FirebaseFirestore.instance.collection('produk');

    // Mendapatkan data dari koleksi "users"
    QuerySnapshot querySnapshot = await users.get();

    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    print(data);
    return data;
  } catch (e) {
    return null;
  }
}

Future<List<Map<String, dynamic>>?> getDataSampah() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('berat_sampah').get();
    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    return data;
  } catch (e) {
    return null;
  }
}
