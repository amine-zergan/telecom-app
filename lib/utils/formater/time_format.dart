// ignore_for_file: file_names

class FormatTime {
  FormatTime._();

  /// Function return [String] for formating date :
  /// example : 2023-04-23
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

  /// Function return [DateTime] from String value
  /// add check and validate value injected in to [toDate] params
  /// reformat code
  static DateTime toDate(String value) {
    // ignore: unused_local_variable
    final format = value.split("-");
    final year = int.parse(format[0]);
    final month = int.parse(format[1]);
    final date = int.parse(format[2]);
    return DateTime(year, month, date);
  }

  /// Function return [bool]
  /// For camparing two DateTime input [start] and [finish]
  static bool isGreat(DateTime start, DateTime finish) {
    return start.compareTo(finish) == -1;
  }
}
