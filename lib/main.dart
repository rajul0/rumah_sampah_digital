import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/home_nav.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/home_nav_aps.dart';
import 'package:rumah_sampah_digital/masyarakat/home_nav_masyarakat.dart';
import 'package:rumah_sampah_digital/welcome_page.dart';
import 'dart:core';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await loadFonts();
  bool isLoggedIn = await checkLoginStatus();
  String? role = await checkRole();

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    role: role,
  ));
}

Future<bool> checkLoginStatus() async {
  // hanya butuh sekali login
  User? user = FirebaseAuth.instance.currentUser;
  return user != null;
}

Future<String?> checkRole() async {
  // hanya butuh sekali login
  User? user = FirebaseAuth.instance.currentUser;
  String? role = user?.displayName;
  return role;
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  var isLoggedIn;
  var role;

  MyApp({
    required this.isLoggedIn,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    if (role == 'Admin Bank Sampah' && isLoggedIn) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          home: HomeNav());
    } else if (role == 'Admin Pos Sampah' && isLoggedIn) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          home: HomeNavAPS());
    } else if (role == 'Masyarakat' && isLoggedIn) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          home: HomeNavMasyarakat());
    } else {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          home: WelcomePage());
    }
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
