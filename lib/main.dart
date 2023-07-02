import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rumah_sampah_digital/welcome_page.dart';

import 'admin_bank_sampah/home_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await loadFonts();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: WelcomePage(),
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
