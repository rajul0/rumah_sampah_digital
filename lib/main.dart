import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/home_nav.dart';
import 'package:rumah_sampah_digital/welcome_page.dart';
import 'dart:core';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await loadFonts();
  bool isLoggedIn = await checkLoginStatus();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<bool> checkLoginStatus() async {
  // hanya butuh sekali login
  User? user = FirebaseAuth.instance.currentUser;
  return user != null;
}

class MyApp extends StatelessWidget {
  var isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: isLoggedIn ? HomeNav() : WelcomePage(),
    );
  }
}

Future<void> loadFonts() async {
  await Future.wait([
    FontLoader('Poppins-Regular').load(),
    FontLoader('Poppins-Bold').load(),
    FontLoader('Poppins-Light').load(),
    FontLoader('Poppins-SemiBold').load(),
  ]);
}
