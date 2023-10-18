import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

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

Future<void> createPDF() async {
  //Create a new PDF document
  PdfDocument document = PdfDocument();

  PdfGrid grid = PdfGrid();

//Add the columns to the grid
  grid.columns.add(count: 3);

//Add header to the grid
  grid.headers.add(1);

//Add the rows to the grid
  PdfGridRow header = grid.headers[0];
  header.cells[0].value = 'RollNo';
  header.cells[1].value = 'Name';
  header.cells[2].value = 'Class';

//Add rows to grid
  PdfGridRow row = grid.rows.add();
  row.cells[0].value = '1';
  row.cells[1].value = 'Arya';
  row.cells[2].value = '6';
  row = grid.rows.add();
  row.cells[0].value = '12';
  row.cells[1].value = 'John';
  row.cells[2].value = '9';
  row = grid.rows.add();
  row.cells[0].value = '42';
  row.cells[1].value = 'Tony';
  row.cells[2].value = '8';

//Draw grid to the page of the PDF document
  grid.draw(page: document.pages.add(), bounds: Rect.fromLTWH(0, 0, 0, 0));

//Dispose the document
  document.dispose();

  //Get external storage directory
  final directory = await getApplicationSupportDirectory();

//Get directory path
  final path = directory.path;

//Create an empty file to write PDF data
  File file = File('$path/Output.pdf');

//Write PDF data
  await file.writeAsBytes(await document.save(), flush: true);

//Open the PDF document in mobile
  OpenFile.open('$path/Output.pdf');
}

void generatePDF() async {
  // Create a new PDF document
  PdfDocument document = PdfDocument();

  // Create a PDF grid
  PdfGrid grid = PdfGrid();

  // Add columns to the grid
  grid.columns.add(count: 3);

  // Add a header to the grid
  grid.headers.add(1);

  // Add rows to the grid
  PdfGridRow header = grid.headers[0];
  header.cells[0].value = 'RollNo';
  header.cells[1].value = 'Name';
  header.cells[2].value = 'Class';

  // Add rows to the grid
  PdfGridRow row = grid.rows.add();
  row.cells[0].value = '1';
  row.cells[1].value = 'Arya';
  row.cells[2].value = '6';
  row = grid.rows.add();
  row.cells[0].value = '12';
  row.cells[1].value = 'John';
  row.cells[2].value = '9';
  row = grid.rows.add();
  row.cells[0].value = '42';
  row.cells[1].value = 'Tony';
  row.cells[2].value = '8';

  // Draw the grid on a page of the PDF document
  PdfPage page = document.pages.add();
  grid.draw(page: page, bounds: Rect.fromLTWH(0, 0, 0, 0));

  // Dispose of the document

  // Get the external storage directory
  final directory = await getApplicationSupportDirectory();

  // Get the directory path
  final path = directory.path;

  // Create an empty file to write PDF data
  File file = File('$path/Output.pdf');

  // Write PDF data
  await file.writeAsBytes(await document.save(), flush: true);
  document.dispose();

  // Open the PDF document using a PDF viewer on the mobile device
  OpenFile.open('$path/Output.pdf');
}
