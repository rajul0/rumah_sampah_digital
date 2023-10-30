import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rumah_sampah_digital/admin_pos_sampah/proses/get_data_APS.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<List<Map<String, dynamic>>?> getDataLaporanSelesai(status) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('laporan_pos')
        .where("status", isEqualTo: status)
        .get();
    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    return data;
  } catch (e) {
    return null;
  }
}

void generatePDFABS(List datas) async {
  // Create a new PDF document
  PdfDocument document = PdfDocument();
  PdfPage page = document.pages.add();

  List tableHeaderName = [
    'No',
    'TPS',
    'Pelapor',
    'tgl_lapor',
    'tgl_selesai',
    'petugas',
    'BSO',
    'BSA',
  ];

  final PdfGrid table = PdfGrid(); // create tabel
  table.columns.add(count: tableHeaderName.length); // initialisasi jumlah kolom

  createHeaderTable(table, tableHeaderName); // Buat tabel header
  final PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 12);
  table.headers.applyStyle(
    PdfGridCellStyle(
      font: font,
      backgroundBrush: PdfSolidBrush(PdfColor(0, 131, 5)),
      textBrush: PdfBrushes.white,
    ),
  );

  for (int i = 0; i < datas.length; i++) {
    var pelapor = await getDataPelapor(datas[i]['id_pelapor']);
    var tanggalLapor = DateFormat('dd-MM-yyyy').format(
      DateTime.parse(
        (datas[i]['tanggal_lapor']),
      ),
    );
    var tanggalSelesai = DateFormat('dd-MM-yyyy').format(
      DateTime.parse(
        (datas[i]['tanggal_selesai']),
      ),
    );
    table.rows.add();
    table.rows[i].cells[0].value = (i + 1).toString();
    table.rows[i].cells[1].value = datas[i]['alamat'];
    table.rows[i].cells[2].value = pelapor['nama'];
    table.rows[i].cells[3].value = tanggalLapor;
    table.rows[i].cells[4].value = tanggalSelesai;
    table.rows[i].cells[5].value = datas[i]['dijemput_oleh'];
    table.rows[i].cells[6].value = datas[i]['berat_sampah_organik'].toString();
    table.rows[i].cells[7].value =
        datas[i]['berat_sampah_anorganik'].toString();
  }
  table.draw(
      page: page,
      bounds: Rect.fromPoints(const Offset(10, 10), const Offset(500, 500)));

  // Get the external storage directory
  final directory = await getApplicationSupportDirectory();

  // Get the directory path
  final path = directory.path;

  // Create an empty file to write PDF data
  var tanggalFile = DateFormat('dd-MM-yyyy').format(DateTime.now());

  File file = File('$path/laporan diterima $tanggalFile.pdf');

  // Write PDF data
  await file.writeAsBytes(await document.save(), flush: true);
  document.dispose();
  // Open the PDF document using a PDF viewer on the mobile device
  OpenFile.open('$path/laporan diterima $tanggalFile.pdf');
}

PdfGrid createHeaderTable(table, tableHeaderName) {
  table.headers.add(1);
  table.headers[0].cells[0].value = tableHeaderName[0];
  table.headers[0].cells[1].value = tableHeaderName[1];
  table.headers[0].cells[2].value = tableHeaderName[2];
  table.headers[0].cells[3].value = tableHeaderName[3];
  table.headers[0].cells[4].value = tableHeaderName[4];
  table.headers[0].cells[5].value = tableHeaderName[5];
  table.headers[0].cells[6].value = tableHeaderName[6];
  table.headers[0].cells[7].value = tableHeaderName[7];

  return table;
}
