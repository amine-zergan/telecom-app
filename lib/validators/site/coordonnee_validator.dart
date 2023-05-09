class ValidatorCoordonnee {
  ValidatorCoordonnee._();
  static String? longitudevalidator(String? value) {
    final RegExp regExp1 = RegExp("[7-9].[0-9]{8}");
    final RegExp regExp2 = RegExp("[1][0-1].[0-9]{8}");
    if (value!.isEmpty) {
      return "code site necessite longitude";
    } else if ((regExp2.hasMatch(value) || regExp1.hasMatch(value))) {
      return "coordonne  non valide ";
    } else if (value.length > 12) {
      return "coordonne de longitude icorrect";
    }
    return null;
  }

  // -------- function validator for latitude validator -------- //

  static String? latitudevalidator(String? value) {
    RegExp regExp = RegExp("[3][0-7].[0-9]{7}");
    if (value!.isEmpty) {
      return "code site necessite latitude";
    } else if (!regExp.hasMatch(value)) {
      return "coordonne de latitude non valide";
    } else if (value.length > 11) {
      return "coordonne de latitude non valide";
    }
    return null;
  }
}
