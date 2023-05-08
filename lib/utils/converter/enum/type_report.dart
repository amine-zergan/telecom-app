enum Report { dpm, drm }

extension EnumReport on Report {
  String value() {
    // ignore: unnecessary_this
    return this.toString().split(".").last;
  }

  static Report fromString(String type) {
    return Report.values.firstWhere(
      (element) => element.value() == type,
    );
  }
}
