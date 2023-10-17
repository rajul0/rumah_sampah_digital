import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/masyarakat/component/build_card_produk.dart';
import 'package:rumah_sampah_digital/masyarakat/detail_produk_page.dart';
import 'package:rumah_sampah_digital/masyarakat/proses/get_data.dart';

class HomePageMasyarakat extends StatefulWidget {
  const HomePageMasyarakat({super.key});
  @override
  _HomePageMasyarakat createState() => _HomePageMasyarakat();
}

class _HomePageMasyarakat extends State<HomePageMasyarakat> {
  Future<List<dynamic>> fetchData() async {
    return await getAllProdukMasyarakat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 38.5),
          SizedBox(
            height: 3.0,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
            ),
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
                              (index) => buildCardProduk(
                                      context,
                                      items[index]['namaProduk'],
                                      items[index]['hargaProduk'],
                                      items[index]['lokasi'],
                                      items[index]['urlImage'], () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailProdukMasyarakatPage(
                                          idDokumen: items[index]['idDokumen'],
                                          namaProduk: items[index]
                                              ['namaProduk'],
                                          gambarProduk: items[index]
                                              ['urlImage'],
                                          hargaProduk: items[index]
                                              ['hargaProduk'],
                                          deskripsiProduk: items[index]
                                              ['deskripsi'],
                                          noHpAdmin: items[index]['noHpAdmin'],
                                        ),
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
