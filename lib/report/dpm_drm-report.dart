// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:telecom/report/models/article_model.dart';
import 'package:telecom/utils/formater/time_format.dart';

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
/////

class LivraisonReport {
  static Future<File> generatePdf({
    required String title,
    required List<Article> articles,
    required String operator,
    required String destination,
    required String ref,
    required String demandeur,
    required String nom_pdf,
  }) async {
    final pdf = Document();
    pdf.addPage(
      MultiPage(
        orientation: PageOrientation.landscape,
        pageFormat: PdfPageFormat.a4,
        footer: (context) {
          final text = "Page ${context.pageNumber} of ${context.pagesCount}";
          return Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 1 * PdfPageFormat.cm),
              child: Text(text));
        },
        build: (context) => [
          headerPage(
            title: title,
            operator: operator,
            ref: ref,
            demandeur: demandeur,
            destination: destination,
            context: context,
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Text(
            "Liste des Articles :",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          buildArticles(
            articles,
          ),
        ],
      ),
    );
    return savePdf(
      name: nom_pdf,
      pdf: pdf,
    );
  }

  static Widget buildArticles(List<Article> articles) => Table.fromTextArray(
        headerAlignment: Alignment.center,
        headerStyle: TextStyle(fontWeight: FontWeight.bold),
        cellAlignment: Alignment.centerLeft,
        headers: [
          "Réf",
          "Nom",
          "Fournisseur",
          "Quantité",
        ],
        data: articles
            .map(
              (article) => [
                article.ref,
                article.name,
                article.fournisseur,
                article.quantite
              ],
            )
            .toList(),
      );
  static Row headerPage(
      {required String operator,
      required String ref,
      required demandeur,
      required String destination,
      required Context context,
      required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              operator,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "868024D/A/M/000",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: PdfColors.black,
                ),
              ),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Ref. :"),
                              SizedBox(width: 5),
                              Text(
                                ref,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Demendeur :"),
                              SizedBox(width: 5),
                              Text(
                                demandeur,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Destination :"),
                              SizedBox(width: 5),
                              Text(
                                destination,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Text("Date :"),
                          SizedBox(width: 5),
                          Text(
                            DateFormat.formDate(
                              DateTime.now(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            dateTimeprint(),
          ],
        ),
      ],
    );
  }

  static Container dateTimeprint() {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: PdfColors.black,
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Text("imprimé le :"),
          SizedBox(width: 10),
          Text(
            DateFormat.formDateWithTime(),
          ),
          SizedBox(
            width: 103,
          ),
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
