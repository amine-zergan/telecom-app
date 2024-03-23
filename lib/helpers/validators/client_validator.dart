class ClientValidator {
  ClientValidator._();

  static String? validateEntreprise(String? value) {
    if (value == null || value.isEmpty) {
      return "merci de saisi le nom de client";
    } else if (value.length < 4) {
      return "nom invalide";
    } else {
      return null;
    }
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "merci de saisi l'address";
    } else if (value.length < 4) {
      return "address invalide";
    } else {
      return null;
    }
  }

  static String? validateResponsable(String? value) {
    if (value == null || value.isEmpty) {
      return "merci de saisi le nom de responsable";
    } else if (value.length < 4) {
      return "nom invalide";
    } else {
      return null;
    }
  }
}
