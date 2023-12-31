import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../utils/formater/time_format.dart';

class PvInstall {
  static Future<File> generatePdf({
    required String technicien,
    required String contact,
    required String b2b,
    required String address,
    required String responsable,
    required String contactClient,
    required double debit,
  }) async {
    final pdf = Document();
    final file = (await rootBundle.load("assets/project/orange.png"))
        .buffer
        .asUint8List();
    pdf.addPage(
      MultiPage(
        orientation: PageOrientation.portrait,
        pageFormat: PdfPageFormat.a4,
        header: (context) {
          return Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(
              top: 0.1 * PdfPageFormat.cm,
            ),
            child: Row(
              children: [
                Image(
                  MemoryImage(file),
                  width: 2.5 * PdfPageFormat.cm,
                  height: 2.5 * PdfPageFormat.cm,
                ),
                SizedBox(
                  width: 3.5 * PdfPageFormat.cm,
                ),
                Text(
                  "Fiche de Mise en Service d'un \nFaiseau Hertizien (FH)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontBold: Font.courier(),
                  ),
                ),
              ],
            ),
          );
        },
        footer: (context) {
          return footerOrange();
        },
        build: (context) => [
          SizedBox(
            height: 0.1 * PdfPageFormat.cm,
          ),
          datePvReception(),
          SizedBox(
            height: 1 * PdfPageFormat.cm,
          ),
          contactOrange(
            technicien: technicien,
            phone: contact,
          ),
          SizedBox(
            height: 0.2 * PdfPageFormat.cm,
          ),
          clientComponent(
            b2b: b2b,
            address: address,
            responsable: responsable,
            contact: contactClient,
          ),
          SizedBox(
            height: 0.2 * PdfPageFormat.cm,
          ),
          caracteristiqueFH(
            debit: "$debit Mbit/s",
          ),
          SizedBox(
            height: 0.5 * PdfPageFormat.cm,
          ),
          componentName(
              "Apres les mesures et les essais necessaires, la liaison a été validée en notre présence.",
              14),
          SizedBox(
            height: 0.5 * PdfPageFormat.cm,
          ),
          Container(
            width: double.infinity,
            height: 4.0 * PdfPageFormat.cm,
            padding: const EdgeInsets.all(
              0.1 * PdfPageFormat.cm,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PdfColors.black,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity / 2,
                    height: 3.9 * PdfPageFormat.cm,
                    padding: const EdgeInsets.all(
                      0.1 * PdfPageFormat.cm,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PdfColors.black,
                      ),
                    ),
                    child: componentName("Cachet et Signature Client", 14),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity / 2,
                    height: 3.9 * PdfPageFormat.cm,
                    padding: const EdgeInsets.all(
                      0.1 * PdfPageFormat.cm,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PdfColors.black,
                      ),
                    ),
                    child: Expanded(
                      child: componentName(
                        "Cachet et Signature Orange Tunisie",
                        14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return savePdf(
      name: "PV de Reception Client Orange",
      pdf: pdf,
    );
  }

  static Container caracteristiqueFH({required String debit}) {
    return Container(
      width: double.infinity,
      height: 3.0 * PdfPageFormat.cm,
      padding: const EdgeInsets.all(
        0.1 * PdfPageFormat.cm,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: PdfColors.black,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          componentName("Caractéristiques de l'accès", null),
          SizedBox(
            height: 0.4 * PdfPageFormat.cm,
          ),
          Row(
            children: [
              intervenantEtTel(
                "Type",
                null,
                "FH",
                100,
              ),
              SizedBox(
                width: 0.5 * PdfPageFormat.cm,
              ),
              intervenantEtTel(
                "Debit",
                null,
                debit,
                130,
              ),
            ],
          )
        ],
      ),
    );
  }

  static Container clientComponent({
    required String b2b,
    required String address,
    required String responsable,
    required String contact,
  }) {
    return Container(
      width: double.infinity,
      height: 6 * PdfPageFormat.cm,
      padding: const EdgeInsets.all(
        0.2 * PdfPageFormat.cm,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: PdfColors.black,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          componentName("Client", null),
          intervenantEtTel("Raison Sociale", null, b2b, null),
          SizedBox(
            height: 0.1 * PdfPageFormat.cm,
          ),
          intervenantEtTel("Address", null, address, null),
          SizedBox(
            height: 0.1 * PdfPageFormat.cm,
          ),
          intervenantEtTel("1er Responsable", null, responsable, null),
          SizedBox(
            height: 0.1 * PdfPageFormat.cm,
          ),
          intervenantEtTel("Contact", null, contact, null),
        ],
      ),
    );
  }

  static Container contactOrange({
    required String technicien,
    required String phone,
  }) {
    return Container(
      width: double.infinity,
      height: 4.0 * PdfPageFormat.cm,
      padding: const EdgeInsets.all(
        0.2 * PdfPageFormat.cm,
      ),
      decoration: BoxDecoration(
        //color: PdfColors.amber100,
        border: Border.all(
          color: PdfColors.black,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          componentName("Orange Tunisie SA", null),
          SizedBox(
            height: 0.5 * PdfPageFormat.cm,
          ),
          intervenantEtTel("Intervenant ", "", technicien, null),
          SizedBox(
            height: 0.1 * PdfPageFormat.cm,
          ),
          intervenantEtTel("Tel ", null, phone, null),
        ],
      ),
    );
  }

  static Text componentName(String name, double? size) {
    return Text(
      name,
      style: TextStyle(
        color: PdfColors.black,
        fontSize: size ?? 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Row intervenantEtTel(
      String component, String? societe, String title, double? width) {
    return Row(
      children: [
        Container(
          width: width == null ? 100 : 50,
          child: Text(
            component,
            style: TextStyle(
              color: PdfColors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width:
              width == null ? 1.5 * PdfPageFormat.cm : 0.8 * PdfPageFormat.cm,
        ),
        Container(
          height: 30,
          width: width ?? 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: PdfColors.black,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.only(
            left: 0.2 * PdfPageFormat.cm,
          ),
          child: Row(
            children: [
              societe == null
                  ? Container()
                  : Text(
                      "NEC ",
                      style: TextStyle(
                        color: PdfColors.black,
                        fontSize: 14,
                        font: Font.courierBold(),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
              SizedBox(
                width: 0.1 * PdfPageFormat.cm,
              ),
              Text(
                title,
                style: TextStyle(
                  color: PdfColors.black,
                  fontSize: 15,
                  font: Font.courierBold(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Row datePvReception() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Tunis Le: "),
        Text(
          DateFormat.formDateWithTime(),
        ),
        SizedBox(
          width: 0.5 * PdfPageFormat.cm,
        ),
      ],
    );
  }

  static Container footerOrange() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 0.1 * PdfPageFormat.cm,
      ),
      child: Column(
        children: [
          Text(
            "Orange Tunisie S.A",
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tel: ",
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                "30013001",
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              SizedBox(
                width: 0.1 * PdfPageFormat.cm,
              ),
              Text(
                "Fax: ",
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                "30013001",
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Text(
            "Immeuble Orange Center Urbain Nord,1003 Tunis",
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  static Future<File> savePdf(
      {required String name, required Document pdf}) async {
    final byte = await pdf.save();
    final dir = await getpath();
    final file = File('$dir/$name.pdf');
    await file.writeAsBytes(byte);
    return file;
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
}
