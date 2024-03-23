enum OrderContact { nom, numero, post }

extension OrderParse on OrderContact {
  String value() {
    // ignore: unnecessary_this
    return this.toString().split(".").last;
  }

  static OrderContact fromString(String type) {
    return OrderContact.values.firstWhere((element) => element.value() == type);
  }
}
