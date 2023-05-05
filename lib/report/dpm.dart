import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

/// File dart for creating dpm en format pdf :
///  need for creating Dpm we need :
/// * dpm class :
///   - date creation :DateTime
///   - ref :String [DPM1702680]
///   - demendeur:[String] user
///   - destination: [site_name]
///   - Operator: [String]
///   - List<Articale> with column :
///     + ref article column
///     + nom article(with description)
///     + fornisseur(project)
///     + quantite
///
///

class DpmReport {
  static Future<File> generatePdf() async {
    final pdf = Document();
    pdf.addPage(
      MultiPage(
        pageFormat: PdfPageFormat.a4,
        footer: (context) {
          final text = "Page ${context.pageNumber} of ${context.pagesCount}";
          return Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 1 * PdfPageFormat.cm),
              child: Text(text));
        },
        build: (context) => [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Rapport Hebdomadaire",
                style: const TextStyle(
                  fontSize: 25,
                ))
          ]),
          SizedBox(height: 2 * PdfPageFormat.cm),
        ],
      ),
    );
    return savePdf(name: "pdf2", pdf: pdf);
  }

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
}
