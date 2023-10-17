import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/pop_up_edit_produk.dart';

class DetailProdukPage extends StatefulWidget {
  final String namaProduk;
  final String gambarProduk;
  final hargaProduk;
  final String deskripsiProduk;
  final bool showEditButton;
  final String idDokumen;

  const DetailProdukPage({
    Key? key,
    required this.idDokumen,
    required this.namaProduk,
    required this.gambarProduk,
    required this.hargaProduk,
    required this.deskripsiProduk,
    required this.showEditButton,
  }) : super(key: key);

  @override
  State<DetailProdukPage> createState() => _DetailProdukPageState();
}

class _DetailProdukPageState extends State<DetailProdukPage> {
  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat.currency(
      symbol: "Rp ",
      decimalDigits: 0,
      locale: "id_ID",
    );
    var hargaProdukFormat = widget.hargaProduk;
    if (widget.hargaProduk != '') {
      hargaProdukFormat = currencyFormat.format(widget.hargaProduk);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.namaProduk,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFD9D9D9),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          widget.showEditButton
              ? Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: TextButton(
                      onPressed: () {
                        popUpEditProdukMasyarakat(context, widget.idDokumen);
                      },
                      child: widget.showEditButton
                          ? const Text(
                              'Edit',
                              style: TextStyle(
                                  fontFamily: 'InriaSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color(0xFF008305)),
                            )
                          : SizedBox()),
                )
              : SizedBox()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.gambarProduk,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Divider(
              color: Color(0xFF008305),
              thickness: 25,
              height: 10,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hargaProdukFormat,
                    style: TextStyle(
                        fontFamily: 'InriaSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.namaProduk,
                    style: TextStyle(fontFamily: 'InriaSans', fontSize: 16),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                        fontFamily: 'InriaSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.deskripsiProduk,
                    style: TextStyle(fontFamily: 'InriaSans', fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text(
              //     'Hubungi Penjual',
              //     style: TextStyle(
              //       fontFamily: 'InriaSans',
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Color(0xFF008305),
              //     fixedSize: Size(180, 30),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => HalamanBeliProduk(
              //                   idDokumen: idDokumen,
              //                   namaProduk: namaProduk,
              //                   hargaProduk: hargaProduk,
              //                   gambarProduk: gambarProduk,
              //                   deskripsiProduk: deskripsiProduk,
              //                   idUser: idUser,
              //                   jasaPengiriman: jasaPengiriman,
              //                   metodePembayaran: metodePembayaran,
              //                 )));
              //   },
              //   child: Text(
              //     'Beli',
              //     style: TextStyle(
              //       fontFamily: 'InriaSans',
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     fixedSize: Size(180, 30),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
