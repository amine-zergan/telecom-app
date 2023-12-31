import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../utils/formater/time_format.dart';

class PvDesInstall {
  static Future<File> generatePdf({
    required String technicien,
    required String contact,
    required String b2b,
    required String address,
    required String responsable,
    required String contactClient,
    required List<String> materiels,
  }) async {
    final pdf = Document();
    pdf.addPage(
      MultiPage(
        orientation: PageOrientation.portrait,
        pageFormat: PdfPageFormat.a4,
        header: (context) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 0.03 * PdfPageFormat.cm,
            ),
            child: Text(
              "PV De Recuperation De Materiels Suite\n Demontage FH",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontBold: Font.courier(),
              ),
            ),
          );
        },
        footer: (context) {
          return footerOrange();
        },
        build: (context) => [
          SizedBox(
            height: 0.5 * PdfPageFormat.cm,
          ),
          datePvReception(),
          SizedBox(
            height: 0.3 * PdfPageFormat.cm,
          ),
          contactOrange(
            technicien: technicien,
            phone: contact,
          ),
          SizedBox(
            height: 0.05 * PdfPageFormat.cm,
          ),
          clientComponent(
            b2b: b2b,
            address: address,
            responsable: responsable,
            contact: contactClient,
          ),
          SizedBox(
            height: 0.1 * PdfPageFormat.cm,
          ),
          retoruMateriels(materiels: []),
          Container(
            width: double.infinity,
            height: 2.7 * PdfPageFormat.cm,
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
                    height: 2.5 * PdfPageFormat.cm,
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
                    height: 2.5 * PdfPageFormat.cm,
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

  static Container retoruMateriels({required List<String> materiels}) {
    return Container(
      width: double.infinity,
      height: 7.0 * PdfPageFormat.cm,
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
          componentName("Materiels A recuperer", null),
          SizedBox(
            height: 0.4 * PdfPageFormat.cm,
          ),
          Bullet(bulletColor: PdfColors.black, text: "Antenne 0.3m 38Ghz"),
          Bullet(
            bulletColor: PdfColors.black,
            text: "idu Neo-Standard 2PLAN",
          ),
          Bullet(
            bulletColor: PdfColors.black,
            text: "idu Neo-Standard 2PLAN",
          ),
          Bullet(bulletColor: PdfColors.black, text: "Radio 38Ghz 3B Low"),
          Bullet(bulletColor: PdfColors.black, text: "Redresseur -48V"),
          Bullet(
              bulletColor: PdfColors.black,
              text: "Routeur LBB141 s/n: S1748006385102212")
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
