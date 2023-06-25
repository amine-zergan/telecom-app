class ValidatorEquipement {
  ValidatorEquipement._();

  /// Function of Type [String?] for generate validate format to field [Nom_Equipement]
  /// validator 1: name required (champ obligaotire)
  static String? validatorName(String? value) {
    if (value == null || value.isEmpty) {
      return "champ obligatoire";
    }
    return null;
  }

  static String? validatorReference(String? value) {
    //RegExp regExp = RegExp("[0]{5}");
    if (value == null || value.isEmpty) {
      return "champ obligatoire";
    } else if (value.length > 5) {
      return "reference ne depasse pas les 5 chiffres";
    } else {
      return null;
    }
  }
}
