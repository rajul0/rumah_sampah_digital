import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuatLaporanAPSPage extends StatefulWidget {
  @override
  _BuatLaporanAPSPageState createState() => _BuatLaporanAPSPageState();
}

class _BuatLaporanAPSPageState extends State<BuatLaporanAPSPage> {
  // Mendapatkan data user
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // untuk membuka file explore hp dan mengupload gambar
  File? _selectedFile;

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
  String _namaBarang = '';
  int _hargaProduk = 0;
  String _kategori = '';
  String _deskripsi = '';
  int _beratBarang = 0;
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

  void _submitForm() {
    // // Fungsi untuk mengirimkan data form ke server atau melakukan tindakan lainnya
    // User? user = _auth.currentUser;
    // _userId = user?.uid;
    // if (_formKey.currentState!.validate() && _selectedFile != null) {
    //   // Simpan data ke database
    //   popUpKonfirmasiTambahProdukJual(
    //       context,
    //       _userId,
    //       _namaBarang,
    //       _hargaProduk,
    //       _kategori,
    //       _deskripsi,
    //       _beratBarang,
    //       _stokProduk,
    //       'Admin Bank Sampah',
    //       _selectedFile);
    // } else {
    //   // Tampilkan pesan kesalahan pada setiap form yang belum diisi dengan benar
    //   setState(() {
    //     _autoValidateMode = AutovalidateMode.always;
    //     _pesanGambar = true;
    //     _pesanKategori = true;
    //   });
    // }
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
                _submitForm();
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
                    _namaBarang = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
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
                decoration: InputDecoration(labelText: 'Berat Barang (gram)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Berat barang tidak boleh kosong';
                  } else if (_pesanBerat) {
                    return 'Berat barang harus berupa angka';
                  }
                  return null;
                },
                onChanged: (value) {
                  try {
                    setState(() {
                      _beratBarang = int.parse(value);
                    });
                  } catch (e) {
                    _pesanBerat = true;
                  }
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
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
