enum Qualification { indoor, outdoor }

extension EnumParse on Qualification {
  String value() {
    // ignore: unnecessary_this
    return this.toString().split(".").last;
  }

  static Qualification fromString(String type) {
    return Qualification.values
        .firstWhere((element) => element.value() == type);
  }
}
