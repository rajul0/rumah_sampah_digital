import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/component/pop_up_jual_produk.dart';
import 'package:rumah_sampah_digital/admin_bank_sampah/jual_produk/proses/proses_jual.dart';
import 'package:rumah_sampah_digital/proses/get_data.dart';

class EditProdukPage extends StatefulWidget {
  final idProduk;
  final String namaProduk;
  final String hargaProduk;
  final String kategori;
  final String deskripsi;
  final String beratProduk;
  final String stokProduk;

  const EditProdukPage({
    Key? key,
    required this.idProduk,
    required this.namaProduk,
    required this.hargaProduk,
    required this.kategori,
    required this.deskripsi,
    required this.beratProduk,
    required this.stokProduk,
  }) : super(key: key);

  @override
  _EditProdukPageState createState() => _EditProdukPageState();
}

class _EditProdukPageState extends State<EditProdukPage> {
  // Mendapatkan data user
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // untuk menyimpan gambar yang diambil dari file explorer hp
  File? _selectedFile;

  // mengambil data produk untuk dimasukkan kedalam form
  Future<List<dynamic>> fetchData() async {
    var hasil = await getDetailProduk(widget.idProduk);
    await Future.delayed(Duration(seconds: 2));
    return hasil;
  }

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      // allowMultiple: true,
    );
    if (result != null) {
      setState(() => _selectedFile = File(result.files.single.path!));
    }
  }

  // Variabel untuk menyimpan nilai input dari form
  String? _userId;
  String _namaProduk = '';
  int _hargaProduk = 0;
  String _kategori = '';
  String _deskripsi = '';
  int _beratProduk = 0;
  int _stokProduk = 0;

  bool _pesanHarga = false;
  bool _pesanBerat = false;
  bool _pesanStok = false;
  bool _pesanGambar = false;
  bool _pesanKategori = false;

  // Pesan berhasil upload berhasil atau tidak
  String pesanUpload = '';

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerHarga = TextEditingController();
  // TextEditingController _controllerKategori = TextEditingController();
  TextEditingController _controllerDeskripsi = TextEditingController();
  TextEditingController _controllerBerat = TextEditingController();
  TextEditingController _controllerStok = TextEditingController();

  void _simpanPerubahan() {}

  // fungsi yg dijalnkan sekali saat halaman diload
  void initState() {
    super.initState();
    _controllerNama.text = widget.namaProduk;
    _controllerHarga.text = widget.hargaProduk;
    _controllerDeskripsi.text = widget.deskripsi;
    _controllerBerat.text = widget.beratProduk;
    _controllerStok.text = widget.stokProduk;
    _kategori = widget.kategori;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      appBar: AppBar(
        backgroundColor: Color(0xFFEBF4F3),
        title: const Text('Form Produk',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'InriaSans',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: TextButton(
              child: const Text(
                'Simpan',
                style: TextStyle(
                    color: Color(0xFF008305),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'InriaSans'),
              ),
              onPressed: () {
                // _submitForm();
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'Foto Produk',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'InriaSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  child: const Text(
                    'Tambah',
                    style: TextStyle(
                        color: Color(0xFF008305),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'InriaSans'),
                  ),
                  onPressed: () {
                    _openFileExplorer();
                    _pesanGambar = false;
                  },
                ),
              ]),
              _selectedFile != null
                  ? Text(_selectedFile!.path,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Color(0xFFAEAEAE),
                          fontFamily: 'InriaSans',
                          fontSize: 12.0))
                  : Text(''),
              _pesanGambar
                  ? const Text(
                      'Gambar produk harus dipilih',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _controllerNama,
                decoration: const InputDecoration(
                  labelText: 'Nama produk',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama produk tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _namaProduk = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _controllerHarga,
                decoration: const InputDecoration(labelText: 'Harga Produk'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Harga Produk tidak boleh kosong';
                  } else if (_pesanHarga) {
                    return 'Harga Produk harus berupa angka';
                  }
                  return null;
                },
                onChanged: (value) {
                  try {
                    setState(() {
                      _hargaProduk = int.parse(value);
                    });
                  } catch (e) {
                    _pesanHarga = true;
                  }
                },
              ),
              const SizedBox(height: 20.0),
              Text(
                'Kategori',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'InriaSans'),
              ),
              SizedBox(
                height: 6.0,
              ),
              Row(
                children: <Widget>[
                  Radio(
                      value: 'Produk Organik',
                      groupValue: _kategori,
                      onChanged: (value) {
                        setState(() {
                          _kategori = value!;
                          _pesanKategori = false;
                        });
                      },
                      activeColor: Color(0xFF008305)),
                  const Text('Produk Organik'),
                  Radio(
                    value: 'Produk Anorganik',
                    groupValue: _kategori,
                    onChanged: (value) {
                      setState(() {
                        _kategori = value!;
                        _pesanKategori = false;
                      });
                    },
                    activeColor: Color(0xFF008305),
                  ),
                  const Text('Produk Anorganik'),
                ],
              ),
              _pesanKategori
                  ? const Text(
                      'Kategori produk harus dipilih',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                      ),
                    )
                  : SizedBox(),
              TextFormField(
                controller: _controllerDeskripsi,
                decoration: InputDecoration(labelText: 'Deskripsi'),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _deskripsi = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _controllerBerat,
                decoration: InputDecoration(labelText: 'Berat Produk (gram)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Berat Produk tidak boleh kosong';
                  } else if (_pesanBerat) {
                    return 'Berat Produk harus berupa angka';
                  }
                  return null;
                },
                onChanged: (value) {
                  try {
                    setState(() {
                      _beratProduk = int.parse(value);
                    });
                  } catch (e) {
                    _pesanBerat = true;
                  }
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _controllerStok,
                decoration: InputDecoration(labelText: 'Stok Produk'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Stok Produk tidak boleh kosong';
                  } else if (_pesanStok) {
                    return 'Stok Produk harus berupa angka';
                  }
                  return null;
                },
                onChanged: (value) {
                  try {
                    setState(() {
                      _stokProduk = int.parse(value);
                      _pesanStok = false;
                    });
                  } catch (e) {
                    _pesanStok = true;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
