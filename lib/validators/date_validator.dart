class DateValidator {
  DateValidator._();

  /// Function return [bool]
  /// For camparing two DateTime input [start] and [finish]
  static bool isGreat(DateTime start, DateTime finish) {
    return start.isBefore(finish);
  }
}
