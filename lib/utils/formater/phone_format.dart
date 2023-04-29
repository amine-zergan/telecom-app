// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

class PhoneFormat {
  PhoneFormat._();

  /// Func return [String] for Formating phoneInput
  /// will format 54xxxxxx To 54 xxx xxx
  static String formater(String value) {
    int i = 0;
    String newphone = "";
    for (i = 0; i < value.length; i++) {
      newphone = newphone + value[i];
      if (i == 1 || i == 4) {
        newphone = newphone + " ";
      }
    }
    return newphone;
  }

  /// Func return [String] for Formating phoneInput
  /// will format 54 xxx xxx To 54xxxxxx
  /// Example :
  /// input_type= "54 948 198"
  /// String value = phoneNumber(input_type)
  /// value ="54948198"
  static String phoneNumber(String value) {
    String phone = "";
    List<String> spliter = phone.split(" ");
    for (int i = 0; i < spliter.length; i++) {
      phone += spliter[i];
    }
    return phone;
  }
}
