// ignore_for_file: non_constant_identifier_names

import 'dart:io';
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
              margin: const EdgeInsets.only(top: 0.5 * PdfPageFormat.cm),
              child: Text(text));
        },
        build: (context) => [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Installation Photographe code Site : $site",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0.5 * PdfPageFormat.cm,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                MemoryImage(file),
                width: 25 * PdfPageFormat.cm,
                height: 5 * PdfPageFormat.cm,
              ),
            ],
          ),
          SizedBox(
            height: 0.25 * PdfPageFormat.cm,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Installation Photograph Site $site OutDoor",
                textAlign: TextAlign.center,
              )
            ],
          ),
          SizedBox(
            height: 0.35 * PdfPageFormat.cm,
          ),
          RowComponent(
            file,
            file,
            "Positionnement de l'antenne dans le pylone",
            "Etiquetage de l'antenne/Cable IF ",
          ),
          SizedBox(
            height: 0.35 * PdfPageFormat.cm,
          ),
          RowComponent(
            file,
            file,
            "IF Connector",
            "Presence de graisse sur les vis de reglage d'antenne ",
          ),
          SizedBox(
            height: 0.35 * PdfPageFormat.cm,
          ),
          RowComponent(
            file,
            file,
            "IF Connector",
            "Presence de graisse sur les vis de reglage d'antenne ",
          ),
          SizedBox(
            height: 3 * PdfPageFormat.cm,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Installation Photograph Site $site InDoor",
                textAlign: TextAlign.center,
              )
            ],
          ),
          SizedBox(
            height: 0.5 * PdfPageFormat.cm,
          ),
          RowComponent(
            file,
            file,
            "Emplacement de l'IDU dans le rack",
            "Presence et fonctionnement des disjoncteur -48v avec etiquetage",
          ),
          SizedBox(
            height: 0.35 * PdfPageFormat.cm,
          ),
          RowComponent(
            file,
            file,
            "Etiquetage de IDU",
            "Cablage et etiquetage des accés GE au mini repartiteur optique",
          ),
          SizedBox(
            height: 0.35 * PdfPageFormat.cm,
          ),
          RowComponent(
            file,
            file,
            "Etiquetage de IDU",
            "Cablage de cables terre V/j sur IDU et raccordement a la barette de BTS",
          ),
          SizedBox(
            height: 0.35 * PdfPageFormat.cm,
          ),
          ImageComponent(file, "Photo generale(clean up site)"),
        ],
      ),
    );
    return savePdf(
      name: nom_pdf,
      pdf: pdf,
    );
  }

  static Row RowComponent(Uint8List file, Uint8List file2, title1, title2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImageComponent(file, title1),
        ImageComponent(
          file2,
          title2,
        ),
      ],
    );
  }

  static Container ImageComponent(Uint8List file, String title) {
    return Container(
      width: 200,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(
          color: PdfColors.black,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            MemoryImage(file),
            width: 200,
            height: 100,
          ),
          Container(
            height: 30,
            width: 200,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          )
        ],
      ),
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
