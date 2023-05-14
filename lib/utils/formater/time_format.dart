// ignore_for_file: file_names

class DateFormat {
  DateFormat._();

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

  /// Function return [String] to format DateTime :
  /// to format : 13/12/2017 09:54

  static String formDateWithTime() {
    DateTime date = DateTime.now();
    String day = formDate(date);
    String time = "${date.hour}:${date.minute}";
    return "$day $time";
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

  /// Function of Type [DateTime] to add duration of days to value and Type DateTime
  static DateTime addDuration(String value, int day) {
    // ignore: no_leading_underscores_for_local_identifiers
    DateTime _date = toDate(value).add(
      Duration(days: day),
    );
    return _date;
  }
}
