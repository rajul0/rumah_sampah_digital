import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/home_page.dart';
import 'package:rumah_sampah_digital/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 47.0, right: 47.0),
          child: Column(
            children: [
              SizedBox(
                height: 148.0,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Rumah Sampah',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'Poppins',
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: ' Digital',
                        style: TextStyle(
                          color: Color(0xFF008305),
                          fontFamily: 'Poppins',
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        )),
                  ])),
              SizedBox(
                height: 37.0,
              ),
              Image(
                image: AssetImage('assets/image/logo_aplikasi.png'),
                width: 240,
                height: 241,
              ),
              SizedBox(
                height: 75.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Selamat Datang',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 18,
                      fontFamily: 'Poppins'),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'klik mulai untuk melanjutkan',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 14,
                      fontFamily: 'Poppins'),
                ),
              ),
              SizedBox(
                height: 44.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePageABS(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 6.0,
                        backgroundColor: Color(0xFF008305)),
                    child: const Text(
                      'Mulai',
                      style: TextStyle(
                        color: Color(0xFFEBF4F3),
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
