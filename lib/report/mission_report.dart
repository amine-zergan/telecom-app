import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generatePdf() async {
    final pdf = Document();
    pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.a4,
        footer: (context) {
          final text = "Page ${context.pageNumber} of ${context.pagesCount}";
          return Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 1 * PdfPageFormat.cm),
              child: Text(text));
        },
        build: (context) => [
              //  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              //   image(bytes),
              // ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Rapport Hebdomadaire",
                    style: const TextStyle(
                      fontSize: 25,
                    ))
              ]),
              SizedBox(height: 2 * PdfPageFormat.cm),
              Row(children: [
                Text("Semaine Du: "),
                Text(" 10/10/2022"),
                SizedBox(width: 1 * PdfPageFormat.cm),
                Text("Au: "),
                Text(" 16/10/2022")
              ]),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              Row(children: [
                Row(children: [
                  Text("Chef d'equipe :"),
                  Text(" Aouini Youssef"),
                ]),
                SizedBox(width: 2 * PdfPageFormat.cm),
                Row(children: [
                  Text("Chef Projez:"),
                  Text(" Aribi Jomaa"),
                ])
              ]),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              Text("Récapitulatif de Mission ",
                  style: const TextStyle(fontSize: 14)),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              buildtable(),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              Text(
                "Taches Effectuées en mission : ",
                style: const TextStyle(fontSize: 12),
              ),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              buildtache(),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              buildvehicule(),
              SizedBox(height: 2 * PdfPageFormat.cm),
              Text(
                "Dépenses engagés en mission : ",
                style: const TextStyle(fontSize: 12),
              ),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              buiddepense(),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              Text(
                "Réservé à l'administration : ",
                style: const TextStyle(fontSize: 12),
              ),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              buidadminstration()
            ]));
    return savePdf(name: "pdf2", pdf: pdf);
  }

  static Widget buidadminstration() =>
      Table.fromTextArray(cellHeight: 20, headers: [
        "Reçu",
        "Justifiés",
        "Différence ",
        "Observation ",
        "Décision"
      ], data: [
        [" ", " ", " ", " "]
      ]);
  static Widget buiddepense() => Table.fromTextArray(cellHeight: 20, headers: [
        "Peage",
        "Achat",
        "Manutention",
        "Total"
      ], data: [
        [" ", " ", " ", " "]
      ]);
  static Widget buildtable() => Table.fromTextArray(
        cellAlignment: Alignment.center,
        headers: [
          "Technicien en \ndeplacement",
          "Lundi ",
          "Mardi ",
          "Mercredi ",
          "jeudi ",
          "vendredi ",
          "samedi ",
          "dimanche "
        ],
        data: [
          ["Toumi Mohsen", "*", "*", "*", "*", "*"],
          [
            "Karim Maghrawi",
            "*",
            "*",
            "*",
            "*",
            "*",
          ],
          ["Oueslati Karim", "*", "*", "*", "*", "*"],
          ["Trabelsi Mohamed", "*", "*", "*", "*", "*"],
        ],
      );

  static Widget buildtache() =>
      Table.fromTextArray(cellAlignment: Alignment.center, headers: [
        "journée",
        "projet",
        "lieu travail",
        "Taches détaillées \n(indiquez le code site, la nature traveaux)"
      ], data: [
        [
          "10/10/2022",
          "NEC",
          "Nabeul",
          "Démontage lien 1,2m NAB_0052_BAR_0003"
        ],
        [
          "11/10/2022",
          "NEC",
          "Nabeul",
          "Démontage lien 1,2m NAB_0077_NAB_0063"
        ],
        ["12/10/2022", "NEC", "Tataouine", "Déplacement a tataouine"],
        ["13/10/2022", "NEC", "Tataouine", "Action maintennace BIR30_BIR_AMIR"],
        ["14/10/2022", "NEC", "Tataouine", "Normalisation DCN el Morra"],
      ]);

  static Widget buildvehicule() =>
      Table.fromTextArray(cellAlignment: Alignment.center, headers: [
        "Vehicule utilisé",
        "index Depart",
        "index arrivée",
        "parcours",
        "Bon versé",
        "Espese versé"
      ], data: [
        ["ISUZU", "", "173994", "173994", "15", ""]
      ]);

  static Widget image(Uint8List bytes) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipRRect(
            horizontalRadius: 10,
            verticalRadius: 10,
            child: Image(MemoryImage(bytes),
                width: 200, height: 100, fit: BoxFit.contain))
      ]);

  static Widget buildlink() => UrlLink(
      child: Text("go the web: https://flutter.dev",
          style: const TextStyle(
              decoration: TextDecoration.underline,
              color: PdfColors.blue,
              fontSize: 20)),
      destination: "https://flutter.dev");

  static Future<String> getpath() async {
    if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();
      return dir.path;
    } else if (Platform.isAndroid) {
      final dir =
          await getExternalStorageDirectories(type: StorageDirectory.documents);
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

  static openfile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
