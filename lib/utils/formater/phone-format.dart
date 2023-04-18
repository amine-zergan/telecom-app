// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

class PhoneFormat {
  PhoneFormat._();

  static String formater(int value) {
    final phone = value.toString();
    int i = 0;
    String newphone = "";
    for (i = 0; i < phone.length; i++) {
      newphone = newphone + phone[i];
      if (i == 1 || i == 4) {
        newphone = newphone + " ";
      }
    }
    return newphone;
  }
}
