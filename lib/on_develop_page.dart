import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OnDevelopPage extends StatefulWidget {
  const OnDevelopPage({super.key});

  @override
  State<OnDevelopPage> createState() => _OnDevelopPageState();
}

class _OnDevelopPageState extends State<OnDevelopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 47.0, right: 47.0),
        child: Column(
          children: [
            SizedBox(
              height: 266.0,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 240,
                  child: Image(
                      image:
                          AssetImage('assets/image/dalam_pengembangan.png'))),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Mohon maaf halaman ini masih dalam tahap pengembangan',
              style: TextStyle(
                color: Color(0xFF000000),
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 153.0,
              height: 43.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 6.0,
                  backgroundColor: Color(0xFF008305),
                ),
                child: const Text(
                  'Kembali',
                  style: TextStyle(
                    color: Color(0xFFEBF4F3),
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
