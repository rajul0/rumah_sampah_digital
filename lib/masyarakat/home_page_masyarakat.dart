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

  Future fetchDataSampah() async {
    return await getDataSampah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 38.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Halo, Apa Kabar?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                  height: 225,
                  width: 298,
                  child: Image(
                    image: AssetImage('assets/image/bg_home.png'),
                  )),
              SizedBox(
                height: 44.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              FutureBuilder(
                future: fetchDataSampah(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sampah Organik: ',
                          style: TextStyle(
                            fontFamily: 'InriaSans',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF484848),
                          ),
                        ),
                        Text(
                          'Sampah Anorganik',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'InriaSans',
                            fontSize: 14.0,
                            color: Color(0xFF008305),
                          ),
                        ),
                      ],
                    );
                    // Text('Error: ${snapshot.error}');
                  } else {
                    var data = snapshot.data;
                    var bsa = data[0]['total_sampah_anorganik'].toString();
                    var bso = data[0]['total_sampah_organik'].toString();

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sampah Organik:  $bso Kg',
                          style: TextStyle(
                            fontFamily: 'InriaSans',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF008305),
                          ),
                        ),
                        Text(
                          'Sampah Anorganik:  $bsa Kg',
                          style: TextStyle(
                            fontFamily: 'InriaSans',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF008305),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 3.0,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 19.0, left: 19.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Produk',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
