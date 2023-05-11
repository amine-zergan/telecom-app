class TaskValidator {
  TaskValidator._();

  static String? descriptionTaskValidate(String? value) {
    if (value == null) {
      return "champ vide...";
    } else if (value.length < 10) {
      return "ajouter une description au tache realisée";
    } else {
      return null;
    }
  }
}
