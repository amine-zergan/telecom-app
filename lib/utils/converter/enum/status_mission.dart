enum Status { started, pending, finished }

extension EnumParse on Status {
  String value() {
    // ignore: unnecessary_this
    return this.toString().split(".").last;
  }

  static Status fromString(String type) {
    return Status.values.firstWhere((element) => element.value() == type);
  }
}
