import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/component/pop_up_laporan_APS.dart';
import 'package:permission_handler/permission_handler.dart';

class BuatLaporanAPSPage extends StatefulWidget {
  @override
  _BuatLaporanAPSPageState createState() => _BuatLaporanAPSPageState();
}

class _BuatLaporanAPSPageState extends State<BuatLaporanAPSPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var permissionGranted;
  // fungsi untuk meminta akses file gambar
  Future _requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
        setState(() {
        permissionGranted = true;
         });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
        return await openAppSettings();
    
    } else {
        print(permissionGranted);
        setState(() {
        permissionGranted = false;
      });
    }
  }

 // fungsi untuk menampilkan pesan jika tidak diberikan izin akses storage
  void _showPesanIzin(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Izin diperlukan untuk mengupload gambar'),
        duration: Duration(seconds: 3),
      ),
    );
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

  Future<void> _ambilGambar() async {
    try {
      final result = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (result != null) {
        setState(() {
          _selectedFile = File(result.path);
        });
      }
    } catch (e) {
      e;
    }
  }

  List<String> listTPS = [
    // daftar tps yang ada
    '1',
    '2',
    '3',
  ];

  // Variabel untuk menyimpan nilai input dari form
  var _tps;
  String _catatan = '';
  File? _selectedFile;
  bool _fileGambarDipilih = false;

  // Pesan berhasil upload berhasil atau tidak
  String pesanUpload = '';
  bool _pesanGambar = false;

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  void _submitForm() {
    // Fungsi untuk mengirimkan data form ke server atau melakukan tindakan lainnya
    User? user = _auth.currentUser;
    String? _userId = user?.uid;
    if (_formKey.currentState!.validate() && _selectedFile != null) {
      // Simpan data ke database
      popUpKonfirmasiBuatLaporan(
        context,
        _userId,
        _tps,
        _catatan,
        _selectedFile,
      );
    } else {
      // Tampilkan pesan kesalahan pada setiap form yang belum diisi dengan benar
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
        _pesanGambar = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF4F3),
      appBar: AppBar(
        backgroundColor: Color(0xFFEBF4F3),
        title: const Text('Form Laporan',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'InriaSans',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        iconTheme: const IconThemeData(color: Colors.black),
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
                  'Foto Tempat Sampah',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'InriaSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                _fileGambarDipilih
                    ? SizedBox(height: 0.0)
                    : TextButton(
                        child: const Text(
                          'Pilih',
                          style: TextStyle(
                              color: Color(0xFF008305),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'InriaSans'),
                        ),
                        onPressed: () async {
                          // permissionGranted = await _requestStoragePermission();
                          // if ( permissionGranted) {
                          _openFileExplorer();
                          _pesanGambar = false;
                          _fileGambarDipilih = true;
                          // } else {
                          //   _showPesanIzin(context);
                          // }
                        },
                      ),
                _fileGambarDipilih
                    ? TextButton(
                        child: const Text(
                          'hapus',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                              fontFamily: 'InriaSans'),
                        ),
                        onPressed: () {
                          setState() {
                            _pesanGambar = false;
                            _fileGambarDipilih = false;
                            _selectedFile = null;
                          }

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => BuatLaporanAPSPage()),
                          );
                        },
                      )
                    : TextButton(
                        child: const Text(
                          'Ambil',
                          style: TextStyle(
                              color: Color(0xFF008305),
                              fontSize: 18.0,
                              fontFamily: 'InriaSans'),
                        ),
                        onPressed: () {
                          _ambilGambar();
                          _pesanGambar = false;
                          _fileGambarDipilih = true;
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
                      'Gambar tempat sampah tidak boleh kosong',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 26.0,
              ),
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null) {
                    return 'Pilih TPS';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(
                    top: 13.0,
                    bottom: 12.0,
                    left: 18.0,
                    right: 18.0,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      borderSide: BorderSide(color: Color(0xFF008305))),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    borderSide: BorderSide(color: Color(0xFF008305)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    borderSide: BorderSide(color: Color(0xFF008305)),
                  ),
                ),
                value: _tps,
                hint: Text('Pilih TPS'),
                onChanged: (value) {
                  setState(() {
                    _tps = value;
                  });
                },
                items: listTPS.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                style: TextStyle(
                  color: Color(0xFF008305),
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Catatan: ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Catatan tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _catatan = value;
                  });
                },
              ),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                  backgroundColor: Color(0xFF008305),
                ),
                child: Text(
                  'Lapor',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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
