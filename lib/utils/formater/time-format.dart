// ignore_for_file: file_names

class FormatTime {
  FormatTime._();
  static String formDate(DateTime date) {
    String day = "";
    String month = "";
    if (date.day < 10) {
      day = "0${date.day}";
    } else {
      day = "${date.day}";
    }
    if (date.month < 10) {
      month = "0${date.month}";
    } else {
      month = "${date.month}";
    }
    final year = date.year;
    final dateforme = "$year-$month-$day";
    return dateforme;
  }
}
