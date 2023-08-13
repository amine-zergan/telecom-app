// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class QaReport {
  static Future<File> generatePdf({
    required String site,
    required String nom_pdf,
  }) async {
    final pdf = Document();
    final file = (await rootBundle.load("assets/project/quality.png"))
        .buffer
        .asUint8List();
    pdf.addPage(
      MultiPage(
        orientation: PageOrientation.portrait,
        pageFormat: PdfPageFormat.a4,
        footer: (context) {
          final text = "Page ${context.pageNumber} of ${context.pagesCount}";
          return Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 1 * PdfPageFormat.cm),
              child: Text(text));
        },
        build: (context) => [
          SizedBox(
            height: 0.25 * PdfPageFormat.cm,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Installation Photographe code Site : $site",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0.5 * PdfPageFormat.cm,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
              MemoryImage(file),
              width: 25 * PdfPageFormat.cm,
              height: 6 * PdfPageFormat.cm,
            ),
          ])
        ],
      ),
    );
    return savePdf(
      name: nom_pdf,
      pdf: pdf,
    );
  }

  static Future<String> getpath() async {
    if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();
      return dir.path;
    } else if (Platform.isAndroid) {
      final dir = await getExternalStorageDirectories(
        type: StorageDirectory.documents,
      );
      return dir!.first.path;
    } else {
      return "";
    }
  }

  static Future<File> savePdf(
      {required String name, required Document pdf}) async {
    final byte = await pdf.save();
    final dir = await getpath();
    final file = File('$dir/$name.pdf');
    await file.writeAsBytes(byte);
    return file;
  }
}
