import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/home_nav.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/jual_produk/edit_produk_page.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/jual_produk/proses/proses_produk.dart';
import 'package:rumah_sampah_digital/proses/get_data.dart';

Future popUpEditProdukMasyarakat(context, idProduk) {
  void konfirmasiHapusProduk() {
    popUpKonfirmasiHapusProduk(context, idProduk);
  }

  void editProduk() async {
    var hasil = await getDetailProduk(idProduk);
    await Future.delayed(Duration(seconds: 2));

    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProdukPage(
          idProduk: idProduk,
          namaProduk: hasil[0]['namaProduk'],
          hargaProduk: hasil[0]['hargaProduk'].toString(),
          kategori: hasil[0]['kategori'],
          deskripsi: hasil[0]['deskripsi'],
          beratProduk: hasil[0]['beratProduk'].toString(),
          stokProduk: hasil[0]['stokProduk'].toString(),
        ),
      ),
    );
  }

  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding:
              EdgeInsets.only(left: 28.0, top: 28.0, right: 28.0, bottom: 5.0),
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
              'Apa yang ingin anda lakukan ? ',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 22.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        editProduk();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 6,
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF008305),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        konfirmasiHapusProduk();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 6.0,
                        backgroundColor: Color(0xFFD90000),
                      ),
                      child: Text(
                        'Hapus Produk',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'batal',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF008305),
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      color: Color(0xFF008305),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      });
}

Future popUpKonfirmasiSimpanEditProduk(
  context,
  idProduk,
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
                    editProdukJual(
                        idProduk,
                        userId,
                        namaProduk,
                        hargaProduk,
                        kategori,
                        deskripsi,
                        beratProduk,
                        stokProduk,
                        jenisAkun,
                        imageFile);
                    popUpBerhasilEditProduk(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6.0,
                    backgroundColor: Color(0xFF008305),
                  ),
                  child: Text(
                    'Yakin',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        );
      });
}

Future popUpBerhasilEditProduk(context) {
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
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF008305)),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeNav()),
                    (route) => false);
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      });
}

Future popUpKonfirmasiHapusProduk(context, idProduk) {
  /* pop up yang berfungsi untuk menanyakan menolak Produk atau batal*/
  void hapusProduk() {
    deleteProduk(idProduk);
  }

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
              'Yakin ingin menghapus produk? ',
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
                    backgroundColor: Color(0xFF008305),
                  ),
                  child: Text(
                    'Batal',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    hapusProduk();
                    popUpBerhasilHapusProduk(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6.0,
                    backgroundColor: Color(0xFFD90000),
                  ),
                  child: Text('Yakin'),
                ),
              ],
            ),
          ],
        );
      });
}

Future popUpBerhasilHapusProduk(context) {
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
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF008305)),
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
