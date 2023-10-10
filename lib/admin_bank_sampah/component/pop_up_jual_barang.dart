import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/home_nav.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/jual_produk/jual_produk_page.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/jual_produk/proses/proses_jual.dart';

Future popUpKonfirmasiTambahProdukJual(
  context,
  userId,
  namaProduk,
  hargaProduk,
  kategori,
  deskripsi,
  beratProduk,
  stokProduk,
  jenisAkun,
  imageFile,
) {
  // Pop up untuk menanyakan laporan yakin telah selesai diproses
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 28.0),
          children: <Widget>[
            SizedBox(
              height: 54.0,
              child: Image.asset(
                'assets/image/question_mark.png',
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              'Yakin ingin menyimpan perubahan?',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 22.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6,
                    backgroundColor: Color(0xFFD90000),
                  ),
                  child: Text(
                    'Batal',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    tambahProdukJual(
                        userId,
                        namaProduk,
                        hargaProduk,
                        kategori,
                        deskripsi,
                        beratProduk,
                        stokProduk,
                        jenisAkun,
                        imageFile);
                    popUpKBerhasilTambahProduk(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6.0,
                    backgroundColor: Color(0xFF008305),
                  ),
                  child: Text('Yakin'),
                ),
              ],
            ),
          ],
        );
      });
}

Future popUpKBerhasilTambahProduk(context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Berhasil',
            textAlign: TextAlign.center,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xFF0095DA)),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeNav()),
                    (route) => false);
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}
