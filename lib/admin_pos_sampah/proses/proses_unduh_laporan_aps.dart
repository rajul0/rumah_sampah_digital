import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdf/widgets.dart' as pdfLib;

void openPdfFile(String pdfPath) async {
  print('asdasda' + pdfPath);
  try {
    await OpenFile.open(pdfPath);
  } catch (e) {
    print(e);
  }
}

Future<List<Map<String, dynamic>>?> getDataLaporanSelesaiAPS(status) async {
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
    // print('Error saat mengambil data dari Firestore: $e');
    return null;
  }
}

pdfLib.Document createPdfDocument(List<Map<String, dynamic>> data) {
  final pdfLib.Document pdf = pdfLib.Document();

  // Tambahkan konten ke dokumen PDF
  pdf.addPage(
    pdfLib.Page(
      build: (context) {
        return pdfLib.Column(
          children: data.map((item) {
            return pdfLib.Text(item['tanggal_diterima'] ?? '');
          }).toList(),
        );
      },
    ),
  );

  return pdf;
}

Future<void> savePdfToLocal(pdfLib.Document pdf) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  print('Direktori Dokumen: ${appDocDir.path}');

  final pdfPath = '${appDocDir.path}/laporan_sampah.pdf';

  final file = File(pdfPath);

  await file.writeAsBytes(await pdf.save());
  openPdfFile(file.path);
}
