class JourConvertor {
  const JourConvertor._();

  /// class of type convertor : used to convert ot switch between
  ///
  /// day duration of mission of type string to integer value to add to start mission
  ///

  static int convertJourMission(String value) {
    switch (value) {
      case "un jour":
        return 1;
      case "deux jours":
        return 2;
      case "trois jours":
        return 3;
      case "quatre jours":
        return 4;
      case "une semaine":
        return 5;
      case "deux semaines":
        return 10;
      default:
        return 5;
    }
  }
}
