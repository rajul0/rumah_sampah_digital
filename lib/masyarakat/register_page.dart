import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/component/register_account.dart';
import 'package:rumah_sampah_digital/login_page.dart';
import 'package:rumah_sampah_digital/proses/proses_akun.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool _passwordVisible = true;
  bool _daftarVisible = false;

  String _errorRegisMessage = '';
  bool _statusNoHp = false;

  String _fullName = '';
  String _noHp = '';
  String _password = '';

  var loginSebagai;
  List<String> sebagai = [
    'Admin Bank Sampah',
    'Admin Pos Sampah',
    'Masyarakat',
  ];

  void _handleMasuk() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => LoginPage()),
      ),
    );
  }

  void register() async {
    var userCredential = await registAccountWithPhoneNumber(
        _fullName, _noHp, _password,
        role: 'Masyarakat');
    await Future.delayed(Duration(seconds: 2));
    print(userCredential);
    if (userCredential != null &&
        userCredential.toString() !=
            '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
      popUpSuccesRegistAccount(context);
    } else if (userCredential.toString() ==
        '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
      _statusNoHp = true;
    }
  }

  void logOut() async {
    // final FirebaseAuth auth = FirebaseAuth.instance;
    // await auth.signOut();
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
                  'Daftar',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 38,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 78.0,
              ),
              Form(
                autovalidateMode: _autoValidateMode,
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama Lengkap tidak boleh kosong';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        _fullName = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Nama Lengkap',
                      labelStyle: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14.0,
                          fontFamily: 'Poppins'),
                      hintText: 'Nama Lengkap',
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
                        return 'Nomor Hp tidak boleh kosong';
                      } else if (_statusNoHp) {
                        return 'Nomor Hp telah terdaftar';
                      }
                      ;
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _noHp = value;
                        _statusNoHp = false;
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
                        return 'Kata sandi tidak boleh kosong';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
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
                    height: 33.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kata sandi tidak boleh kosong';
                      } else if (value != _password) {
                        return 'Kata sandi tidak sama';
                      }
                      print(value == _password);
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Konfirmasi Kata Sandi',
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
                    height: 77.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 53.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          register();
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
                        'Daftar',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sudah punya akun? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                          )),
                      GestureDetector(
                        onTap: _handleMasuk,
                        child: Text('masuk',
                            style: TextStyle(
                              color: Color(0xFF008305),
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            )),
                      )
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
