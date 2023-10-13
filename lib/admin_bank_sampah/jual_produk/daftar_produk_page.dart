import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/build_card_jual_barang.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/jual_produk/detail_produk_jual_page.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/jual_produk/jual_page.dart';
import 'package:rumah_sampah_digital/proses/get_data.dart';

class JualProdukABS extends StatefulWidget {
  const JualProdukABS({super.key});
  @override
  _JualProdukABS createState() => _JualProdukABS();
}

class _JualProdukABS extends State<JualProdukABS> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<dynamic>> fetchData() async {
    return await getAllProduk();
  }

  static Future fetchDataPengguna() async {
    // Kode untuk melakukan fetch data pada Future
    var data;
    // simulasi API request
    getDataUser().then((value) => data = value);
    await Future.delayed(Duration(seconds: 2));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat.currency(
      symbol: "Rp ",
      decimalDigits: 0,
      locale: "id_ID",
    );

    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 60.0),
          Padding(
            padding: EdgeInsets.only(left: 21.0, right: 8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                        future: fetchDataPengguna(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data;

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data['nama'],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'InriaSans',
                                        fontSize: 18.0)),
                                SizedBox(
                                  width: 7.0,
                                ),
                                Text(data['role'],
                                    style: TextStyle(
                                      fontFamily: 'InriaSans',
                                      fontSize: 10.0,
                                    )),
                                SizedBox(
                                  width: 7.0,
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
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 38.5),
          SizedBox(
            height: 3.0,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JualProdukABS2()));
            },
            child: Container(
                padding: EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    const BoxShadow(
                      color: Color(0xFFD9D9D9),
                      blurRadius: 5.0,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: Text(
                  'Jual Produk',
                  style: TextStyle(
                      color: Color(0xFF008305),
                      fontFamily: 'InriaSans',
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                ),
                alignment: Alignment.center),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 5.0, right: 19.0, bottom: 19.0, left: 19.0),
            child: FutureBuilder<List<dynamic>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Ketika data masih dimuat, tampilkan indikator loading

                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Ketika terjadi error dalam pengambilan data
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Ketika data telah berhasil diambil
                  List items = snapshot.data!;
                  return items.isEmpty
                      ? SizedBox(
                          height: 20.0,
                          width: double.infinity,
                          child: Text(
                            "Belum ada produk yang dijual",
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 8.0,
                          children: List.generate(
                              items.length,
                              (index) => buildCardJualProduk(
                                      context,
                                      items[index]['namaProduk'],
                                      items[index]['hargaProduk'],
                                      items[index]['lokasi'],
                                      items[index]['urlImage'], () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailProdukPage(
                                            idDokumen: items[index]
                                                ['idDokumen'],
                                            namaProduk: items[index]
                                                ['namaProduk'],
                                            gambarProduk: items[index]
                                                ['urlImage'],
                                            hargaProduk: items[index]
                                                ['hargaProduk'],
                                            deskripsiProduk: items[index]
                                                ['deskripsi'],
                                            showEditButton: true),
                                      ),
                                    );
                                  })),
                        );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
