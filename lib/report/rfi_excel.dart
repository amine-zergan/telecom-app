import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:telecom/view/pages/home/views/settings/reports/rapport_rfi/rfi_model.dart';

class SurveyRfiExcel {
  static Future<File> createExcel(RFIModel model) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    sheet.showGridlines = false;
    // Enable calculation for worksheet.
    sheet.enableSheetCalculations();

    sheet.showGridlines = true;

    sheet.getRangeByName('A1:C1').setText('Rapport Survey Site');
    sheet.getRangeByName('A1:C1').merge();
    sheet.getRangeByName('A1:C1').cellStyle.fontSize = 14;
    sheet.getRangeByName('A1:C1').cellStyle.backColor = "#FFFF55";
    sheet.getRangeByName('A1:C1').cellStyle.borders.all.lineStyle =
        LineStyle.thick;

    //Set data in the worksheet.

    numeroFh(sheet, 'F4:G4', "OUTDOOR");
    numeroFh(sheet, 'D4:E4', "RFI SURVEY SHEET");
    numeroFh(sheet, 'M4:N4', "RFI SURVEY SHEET");
    numeroFh(sheet, 'O4:P4', "OUTDOOR");

    numeroFh(sheet, 'A5', 'Projet');
    numeroFh(sheet, 'B5', 'ORANGE');

    sheet.getRangeByName('C5:D5').setText('Date :');
    sheet.getRangeByName('C5:D5').merge();
    sheet.getRangeByName('C5:D5').cellStyle.borders.left.lineStyle =
        LineStyle.thin;
    sheet.getRangeByName('C5:D5').cellStyle.borders.top.lineStyle =
        LineStyle.thin;
    sheet.getRangeByName('C5:D5').cellStyle.borders.bottom.lineStyle =
        LineStyle.thin;
    sheet.getRangeByName('C5:D5').cellStyle.hAlign = HAlignType.right;
    sheet.getRangeByName('E5:H5').setDateTime(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
    sheet.getRangeByName('E5:H5').merge();
    sheet.getRangeByName('E5:H5').cellStyle.borders.right.lineStyle =
        LineStyle.thin;
    sheet.getRangeByName('E5:H5').cellStyle.borders.top.lineStyle =
        LineStyle.thin;
    sheet.getRangeByName('E5:H5').cellStyle.borders.bottom.lineStyle =
        LineStyle.thin;
    sheet.getRangeByName('E5:H5').cellStyle.hAlign = HAlignType.left;
    sheet.getRangeByName('E5:H5').numberFormat =
        '[\$-x-sysdate]dddd, mmmm dd, yyyy';
    sheet.getRangeByName('E5:H5').cellStyle.fontSize = 12;

    numeroFh(sheet, 'A6', 'Nom de Site');
    numeroFh(
      sheet,
      'B6:E6',
      model.site,
    );
    numeroFh(sheet, 'F6:H6', 'Type de Site');
    numeroFh(sheet, 'A7', 'Code Site');
    numeroFh(sheet, 'B7:E7', model.site.toUpperCase());
    numeroFhTypeSite(sheet, 'F7', 'Nodal', model.type.name == "nodal");
    numeroFhTypeSite(sheet, 'G7', 'Agg', model.type.name == "agg");
    numeroFhTypeSite(sheet, 'H7', 'Terminale', model.type.name == "ter");
    numeroFh(sheet, 'A9:A14', 'N°');
    numeroFh(sheet, 'J9:K9', 'ITEM');
    numeroFh(sheet, 'B9:C9', 'ITEM');
    numeroFh(sheet, 'D9:H9', 'COMMENTAIRE');
    numeroFh(sheet, 'L9:Q9', 'COMMENTAIRE');
    numeroFh(sheet, 'B10:B12', 'Pylone');

    numeroFh(sheet, 'J10:K10', 'SHELTER');
    numeroFh(sheet, 'L10:Q10', model.bts! ? 'NOK' : "OK");
    numeroFh(sheet, 'J11:K11', 'Chemin de cable');
    numeroFh(sheet, 'L11:Q11', model.cheminCable! ? "OK" : 'NOK');
    numeroFh(sheet, 'J12:K12', 'Rack espace');
    numeroFh(sheet, 'L12:Q12', model.rackEspace! ? "OK" : 'NOK');
    numeroFh(sheet, 'J13:K13', 'DC');
    numeroFh(sheet, 'L13:Q13', model.courantDc! ? "OK" : "NOK");

    numeroFh(sheet, 'J14:K15', 'Disjoncteur');
    numeroFh(sheet, 'L14:M14', 'Nbr DISJ');
    numeroFh(sheet, 'N14:O14', 'Capacite Disj(A)');
    numeroFh(sheet, 'P14:Q14', 'Commentaire');
    numeroFh(sheet, 'L15:M15', ' ');
    numeroFh(sheet, 'N15:O15', ' ');
    numeroFh(sheet, 'P15:Q15', ' ');
    numeroFh(sheet, 'J16:K16', 'AC');
    numeroFh(sheet, 'J17:K17', 'GND');
    numeroFh(sheet, 'J18:K18', 'CLIM');
    numeroFh(sheet, 'J19:K19', 'GENERATEUR');
    numeroFh(sheet, 'L16:Q16', model.courantAc! ? "OK" : 'NOK');
    numeroFh(sheet, 'L17:Q17', model.gND! ? "OK" : 'NOK');
    numeroFh(sheet, 'L18:Q18', model.clim! ? "OK" : 'NOK');
    numeroFh(sheet, 'L19:Q19', '');
    numeroRFICommentaire(sheet, 'J20:Q32', """
     ${model.details}
    """);

    numeroFh(sheet, 'k34:L34', ' Representant NEC ');
    numeroFh(sheet, 'M34:N34', model.supervior);
    numeroFh(sheet, 'C10:C12', '${model.pylone} m');
    numeroFh(sheet, 'D10:H12', "");
    numeroFh(sheet, 'B13:B14', 'N° FH');
    numeroFh(sheet, 'C13:C14', 'SUPPORT');
    numeroFh(sheet, 'D13:E14', 'SUPPORT BRACON');
    numeroFh(sheet, 'F13:H14', 'COMMENTAIRE');
    numeroFh(sheet, "A15:A26", "");
    numeroFh(sheet, "B15", "N°1");
    numeroFh(sheet, "C15", "");
    numeroFh(sheet, "D15:E15", model.bracon! ? "" : "");
    numeroFh(sheet, "F15:H15", model.support);

    ///##############################///
    numeroFh(sheet, "B16", "N°2");
    numeroFh(sheet, "C16", "");
    numeroFh(sheet, "D16:E16", "");
    numeroFh(sheet, "F16:H16", "");

    ///#############################///
    numeroFh(sheet, "B17", "N°3");
    numeroFh(sheet, "C17", "");
    numeroFh(sheet, "D17:E17", "");
    numeroFh(sheet, "F17:H17", "");

    ///#############################///
    numeroFh(sheet, "B18", "N°4");
    numeroFh(sheet, "C18", "");
    numeroFh(sheet, "D18:E18", "");
    numeroFh(sheet, "F18:H18", "");

    ///############################///
    numeroFh(sheet, "B19", "N°5");
    numeroFh(sheet, "C19", "");
    numeroFh(sheet, "D19:E19", "");
    numeroFh(sheet, "F19:H19", "");

    ///###########################///
    numeroFh(sheet, "B20", "N°6");
    numeroFh(sheet, "C20", "");
    numeroFh(sheet, "D20:E20", "");
    numeroFh(sheet, "F20:H20", "");

    ///###########################///
    numeroFh(sheet, "B21", "N°7");
    numeroFh(sheet, "C21", "");
    numeroFh(sheet, "D21:E21", "");
    numeroFh(sheet, "F21:H21", "");

    ///###########################///
    numeroFh(sheet, "B22", "N°8");
    numeroFh(sheet, "C22", "");
    numeroFh(sheet, "D22:E22", "");
    numeroFh(sheet, "F22:H22", "");

    ///###########################///
    numeroFh(sheet, "B23", "N°9");
    numeroFh(sheet, "C23", "");
    numeroFh(sheet, "D23:E23", "");
    numeroFh(sheet, "F23:H23", "");

    ///###########################///
    numeroFh(sheet, "B24", "N°10");
    numeroFh(sheet, "C24", "");
    numeroFh(sheet, "D24:E24", "");
    numeroFh(sheet, "F24:H24", "");

    ///###########################///
    numeroFh(sheet, "B25", "N°11");
    numeroFh(sheet, "C25", "");
    numeroFh(sheet, "D25:E25", "");
    numeroFh(sheet, "F25:H25", "");

    ///###########################///
    numeroFh(sheet, "B26", "N°12");
    numeroFh(sheet, "C26", "");
    numeroFh(sheet, "D26:E26", "");
    numeroFh(sheet, "F26:H26", "");

    ///################### ///
    numeroFh(sheet, "A27:A28", "Barette de terre");
    numeroFh(sheet, "B27:B28", "Barette de terre");
    numeroFh(sheet, "C27:C28", "Position");
    numeroFh(sheet, "D27:D28", "Barette de terre");
    numeroFh(sheet, "E27:E28", "Position");
    numeroFh(sheet, "F27:F28", "Tremie");
    numeroFh(sheet, "G27:H28", model.tremie! ? "OK" : "NOK");

    numeroFh(sheet, "A29:A35", " ");

    ///##########################################///
    numeroFh(sheet, "B29", "N° 1");
    numeroFh(sheet, "B30", "N° 3");
    numeroFh(sheet, "B31", "N° 5");
    numeroFh(sheet, "B32", "N° 7");
    numeroFh(sheet, "B33", "ECHELLE");
    numeroFh(sheet, "B34", "GARDIEN");
    numeroFh(sheet, "B35", "ACCES/CLE");

    ///##########################################///
    numeroFh(sheet, "C29", model.barrette! ? "OK" : "NOK");
    numeroFh(sheet, "C30", "");
    numeroFh(sheet, "C31", "");
    numeroFh(sheet, "C32", "");
    numeroFh(sheet, "C33:H33", "");
    numeroFh(sheet, "C34:H34", "");
    numeroFh(sheet, "C35:H35", "");

    ///##########################################///
    numeroFh(sheet, "D29", "N° 2");
    numeroFh(sheet, "D30", "N° 4");
    numeroFh(sheet, "D31", "N° 6");
    numeroFh(sheet, "D32", "N° 8");

    ///##########################################///
    numeroFh(sheet, "E29", "");
    numeroFh(sheet, "E30", "");
    numeroFh(sheet, "E31", "");
    numeroFh(sheet, "E32", "");

    ///###############################///
    numeroFh(sheet, "F29:F30", "Chemin de cable V");
    numeroFh(sheet, "F31:F32", "Chemin de cable H");

    numeroFh(sheet, "G29:H30", model.cheminV! ? "OK" : "NOK");
    numeroFh(sheet, "G31:H32", model.cheminH! ? "OK" : "NOK");
    // sheet.pictures.addStream(40, 1, picture);
    // sheet.pictures.addStream(40, 9, picture1);
    // final Picture pic = sheet.pictures[0];
    // final Picture pic1 = sheet.pictures[1];

// Re-size an image
    // pic.height = 400;
    // pic.width = 400;
    // pic1.height = 300;
    // pic1.width = 300;

    //Save and launch the excel.
    final dir = await getpath();
    final byte = workbook.saveAsStream();
    final file = File(
        '$dir/Survey site_${model.site.toUpperCase()}_${DateTime.now()}.xlsx');
    await file.writeAsBytes(byte);
    //Dispose the document.
    workbook.dispose();
    //Save and launch file.
    return file;
  }

  static void numeroRFICommentaire(
    Worksheet sheet,
    String numero,
    String valeur,
  ) {
    sheet.getRangeByName(numero).setText(valeur);
    sheet.getRangeByName(numero).merge();
    sheet.getRangeByName(numero).cellStyle.fontSize = 12;
    sheet.getRangeByName(numero).cellStyle.wrapText = true;
    sheet.getRangeByName(numero).cellStyle.hAlign = HAlignType.left;
    sheet.getRangeByName(numero).cellStyle.vAlign = VAlignType.top;
    sheet.getRangeByName(numero).cellStyle.borders.all.lineStyle =
        LineStyle.thin;
  }

  static void numeroFh(
    Worksheet sheet,
    String numero,
    String valeur,
  ) {
    sheet.getRangeByName(numero).setText(valeur);
    sheet.getRangeByName(numero).merge();
    sheet.getRangeByName(numero).cellStyle.fontSize = 9;
    sheet.getRangeByName(numero).cellStyle.wrapText = true;
    sheet.getRangeByName(numero).cellStyle.hAlign = HAlignType.center;
    sheet.getRangeByName(numero).cellStyle.vAlign = VAlignType.center;
    sheet.getRangeByName(numero).cellStyle.borders.all.lineStyle =
        LineStyle.thin;
  }

  static void numeroFhTypeSite(
      Worksheet sheet, String numero, String valeur, bool type) {
    sheet.getRangeByName(numero).setText(valeur);
    sheet.getRangeByName(numero).merge();
    sheet.getRangeByName(numero).cellStyle.fontSize = 9;
    sheet.getRangeByName(numero).cellStyle.wrapText = true;
    sheet.getRangeByName(numero).cellStyle.hAlign = HAlignType.center;
    sheet.getRangeByName(numero).cellStyle.vAlign = VAlignType.center;
    sheet.getRangeByName(numero).cellStyle.backColor =
        type == false ? "#FFFFFF" : "#FFFF55";
    sheet.getRangeByName(numero).cellStyle.borders.all.lineStyle =
        LineStyle.thin;
  }

  static Future<String> getpath() async {
    if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();
      // ignore: avoid_print
      print("IOS excel create ");
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
