import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/home_nav.dart';
import 'package:rumah_sampah_digital/on_develop_page.dart';

import 'masyarakat/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool _passwordVisible = true;
  bool _daftarVisible = false;

  String _errorLoginMessage = '';

  String _noHp = '';
  String _password = '';

  var loginSebagai;
  List<String> sebagai = [
    'Admin Bank Sampah',
    'Admin Pos Sampah',
    'Masyarakat',
  ];

  void _handleDaftar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => RegisterPage()),
      ),
    );
  }

  void login() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: '${_noHp}@bsd.com', password: _password);
      // mendapatkan sebagai akunnya
      User? user = auth.currentUser;
      String? role = user?.displayName;
      if (role == 'Admin Bank Sampah') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeNav()),
        );
      } else if (role == 'Masyarakat') {
        _errorLoginMessage = 'Akun ini terdaftar sebagai ${role}';
      }
    } on FirebaseAuthException catch (error) {
      _errorLoginMessage = 'Email atau password yang anda masukkan salah';
    }
  }

  void logOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 47.0,
            right: 47.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120.0,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Masuk',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 38,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 162.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  _errorLoginMessage,
                  style: TextStyle(
                    fontFamily: 'InriaSans',
                    fontSize: 14.0,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10.0),
              Form(
                autovalidateMode: _autoValidateMode,
                key: _formKey,
                child: Column(children: [
                  DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Pilih login sebagai';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(
                        top: 13.0,
                        bottom: 12.0,
                        left: 18.0,
                        right: 18.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(color: Color(0xFF008305))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(color: Color(0xFF008305)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(color: Color(0xFF008305)),
                      ),
                    ),
                    value: loginSebagai,
                    hint: Text('Pilih login sebagai'),
                    onChanged: (value) {
                      setState(() {
                        loginSebagai = value;
                        if (value == 'Masyarakat') {
                          _daftarVisible = true;
                        } else {
                          _daftarVisible = false;
                        }
                      });
                    },
                    items:
                        sebagai.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    style: TextStyle(
                      color: Color(0xFF008305),
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 33.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nomor Hp tidak boleh kosong';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _errorLoginMessage = '';
                        _noHp = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'No.Hp',
                      labelStyle: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14.0,
                          fontFamily: 'Poppins'),
                      hintText: '0812xxxxxxxx',
                      hintStyle: TextStyle(
                          color: Color(0xFF000000).withOpacity(0.3),
                          fontSize: 14.0,
                          fontFamily: 'Poppins'),
                      contentPadding: EdgeInsets.only(
                        top: 13.0,
                        bottom: 12.0,
                        left: 18.0,
                        right: 18.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(color: Color(0xFF008305))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(color: Color(0xFF008305)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(color: Color(0xFF008305)),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF000000),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 33.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _errorLoginMessage = '';
                        _password = value;
                      });
                    },
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Kata Sandi',
                      labelStyle: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14.0,
                          fontFamily: 'Poppins'),
                      hintText: '********',
                      hintStyle: TextStyle(
                          color: Color(0xFF000000).withOpacity(0.3),
                          fontSize: 14.0,
                          fontFamily: 'Poppins'),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              _passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          )),
                      contentPadding: EdgeInsets.only(
                        top: 13.0,
                        bottom: 12.0,
                        left: 18.0,
                        right: 18.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(color: Color(0xFF008305))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(color: Color(0xFF008305)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(color: Color(0xFF008305)),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF000000),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 159.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 53.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login();
                        } else {
                          setState(() {
                            _autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 6.0,
                        backgroundColor: Color(0xFF008305),
                      ),
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                          color: Color(0xFFEBF4F3),
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  _daftarVisible
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Belum punya akun? ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                )),
                            GestureDetector(
                              onTap: _handleDaftar,
                              child: Text('daftar',
                                  style: TextStyle(
                                    color: Color(0xFF008305),
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                            )
                          ],
                        )
                      : SizedBox(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
