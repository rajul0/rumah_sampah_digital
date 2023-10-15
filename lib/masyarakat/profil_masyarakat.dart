import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/pop_up_proses_akun.dart';
import 'package:rumah_sampah_digital/proses/get_data.dart';

class ProfilMasyarakatPage extends StatefulWidget {
  const ProfilMasyarakatPage({super.key});

  @override
  State<ProfilMasyarakatPage> createState() => _ProfilMasyarakatPageState();
}

class _ProfilMasyarakatPageState extends State<ProfilMasyarakatPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  static Future fetchData() async {
    // Kode untuk melakukan fetch data pada Future
    var data;
    // simulasi API request
    getDataUser().then((value) => data = value);
    await Future.delayed(Duration(seconds: 2));
    return data;
  }

  var dataPengguna = fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      body: Padding(
        padding:
            EdgeInsets.only(top: 46.0, left: 57.0, right: 57.0, bottom: 84.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          30), // atur nilai sesuai keinginan
                      child: Image.asset('assets/image/profile_img.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt, color: Colors.white),
                          iconSize: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              FutureBuilder(
                future: dataPengguna,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    String noHp = data['no_hp'];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          data['nama'],
                          style: TextStyle(
                            fontFamily: 'InriaSans',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF484848),
                          ),
                        ),
                        Text(
                          data['role'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'InriaSans',
                            fontSize: 14.0,
                            color: Color(0xFF008305),
                          ),
                        ),
                        Text(
                          "($noHp)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'InriaSans',
                            fontSize: 14.0,
                            color: Color(0xFF878585),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox(
                      height: 42,
                      width: 120,
                      child: Container(
                        color: Color(0xFFE3E3E3),
                      ),
                    );
                  }
                },
              ),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  popUpLogout(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                label: Text('Keluar',
                    style: TextStyle(
                      fontFamily: 'InriaSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 18,
                    )),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color(0xFFEBF4F3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
