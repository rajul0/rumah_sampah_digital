import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<dynamic> registAccountWithPhoneNumber(namaLengkap, noHp, password,
    {role = null}) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String email = '${noHp}@bsd.com';
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    // daftar akun

    User? user = userCredential.user;
    await user?.updateDisplayName(role);
    // update display name akun(role atau kelompok user)
    _db.collection('akun').doc().set({
      "uid": user?.uid,
      "no_hp": noHp,
      "nama": namaLengkap,
      "role": role,
    }).catchError((error) {
      print("Failed to add user to firestore: $error");
      return null;
    });
    return userCredential;
  } catch (error) {
    return error;
  }
}
