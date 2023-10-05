import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/pop_up_proses_akun.dart';

class ProfilABSPage extends StatefulWidget {
  const ProfilABSPage({super.key});

  @override
  State<ProfilABSPage> createState() => _ProfilABSPageState();
}

class _ProfilABSPageState extends State<ProfilABSPage> {
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
              SizedBox(height: 100),
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
