import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailProdukMasyarakatPage extends StatefulWidget {
  final String namaProduk;
  final String gambarProduk;
  final hargaProduk;
  final String deskripsiProduk;
  final int noHpAdmin;

  const DetailProdukMasyarakatPage({
    Key? key,
    required this.namaProduk,
    required this.gambarProduk,
    required this.hargaProduk,
    required this.deskripsiProduk,
    required this.noHpAdmin,
  }) : super(key: key);

  @override
  State<DetailProdukMasyarakatPage> createState() =>
      _DetailProdukMasyarakatPageState();
}

class _DetailProdukMasyarakatPageState
    extends State<DetailProdukMasyarakatPage> {
  void openWhatsApp(
      {required BuildContext context,
      required int number,
      required String message}) async {
    String url = "https://api.whatsapp.com/send?phone=62$number&text=$message";
    if (Platform.isAndroid) {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }

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
              ElevatedButton(
                onPressed: () {
                  openWhatsApp(
                      context: context,
                      number: widget.noHpAdmin,
                      message: 'Hai apakah barang ini masih ada?');
                },
                child: Text(
                  'Hubungi Penjual',
                  style: TextStyle(
                    fontFamily: 'InriaSans',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF008305),
                  fixedSize: Size(180, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
