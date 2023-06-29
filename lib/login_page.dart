import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 47.0,
            right: 47.0,
          ),
          child: Column(children: [
            SizedBox(
              height: 120.0,
            ),
            Text('Masuk',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 38,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ))
          ]),
        ),
      ),
    );
  }
}
