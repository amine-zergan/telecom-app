// ignore_for_file: file_names

class ValidatorProfile {
  ValidatorProfile._();

  /// Function return [String?] used For validation Email
  /// use RegExp format to verifie input [String?]
  /// It will return Field emty if [String?] is null Or invalid Email address
  ///
  static String? validatorEmail(String? value) {
    final RegExp exp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value!.isEmpty) return "champs obligatoire";
    if (!exp.hasMatch(value)) return " email non conforme, verifie votre email";
    return null;
  }

  /// Function return [String?] used For validation Phone
  /// use RegExp format to verifie input [String?]
  ///
  /// with PhoneTextFormatter will champ the length of phone_number
  /// It will return Field emty if [String?] is null Or invalid Phone
  ///
  static String? validatorPhone(String? value) {
    final RegExp regExp = RegExp("[2359][0-9][' '][0-9]{3}[' '][0-9]{3}");
    if (value!.isEmpty) {
      return "champ numero de tel obligatoire";
    } else if (!regExp.hasMatch(value)) {
      return "numero de telephone incorrect";
    } else if (value.length > 10) {
      return "numero de telephone ne depasse pas les 8 chiffres";
    } else {
      return null;
    }
  }

  static String? validatorPhoneFix(String? value) {
    final RegExp regExp = RegExp("[7][1-8][' '][0-9]{3}[' '][0-9]{3}");
    if (value!.isEmpty) {
      return null;
    } else if (!regExp.hasMatch(value)) {
      return "numero de telephone incorrect";
    } else if (value.length > 10) {
      return "numero de telephone ne depasse pas les 8 chiffres";
    } else {
      return null;
    }
  }

  // ------------ func for validate name ---------------- //
  static String? validatorName(String? value) {
    if (value!.isEmpty) {
      return "champ nom est obligatoire";
    } else if (value.length < 4) {
      return "votre nom doit etre plus que 4 caractere";
    } else {
      return null;
    }
  }

  static String? validatePoste(String? value) {
    final RegExp exp = RegExp("[0-9]{4}");
    // ignore: unnecessary_null_comparison
    if (value!.isEmpty || value == null) {
      return "champ code postale obligatoire";
    } else if (!exp.hasMatch(value)) {
      return "code postale invalide ";
    } else {
      return null;
    }
  }

  static String? validateAddress(String? value) {
    if (value!.isEmpty) {
      return "champ address est obligatoire";
    } else if (value.length < 4) {
      return "merci de mettre la correct address";
    } else {
      return null;
    }
  }
}
