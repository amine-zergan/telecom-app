// ignore_for_file: file_names

class ValidatorProfile {
  ValidatorProfile._();

  static String? validatorEmail(String? value) {
    final RegExp exp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value!.isEmpty) return " champs vide";
    if (!exp.hasMatch(value)) return " email non conforme, verifie votre email";
    return null;
  }

  static String? validatorPhone(String? value) {
    final RegExp regExp = RegExp("[259][0-9]{7}");
    if (value!.isEmpty) {
      return "champ vide";
    } else if (!regExp.hasMatch(value)) {
      return "numero de telephone invalide";
    } else if (value.length > 8) {
      return "numero de telephone invalide";
    } else {
      return null;
    }
  }

  // ------------ func for validate name ---------------- //
  static String? validatorName(String? value) {
    if (value!.isEmpty) {
      return "nom doit pas etre vide";
    } else if (value.length < 4) {
      return "votre nom doit etre plus que 4 caractere";
    } else {
      return null;
    }
  }

  static String? validatePoste(String? value) {
    return null;
  }

  static String? validateAddress(String? value) {
    return null;
  }
}
