import 'dart:io';

class SizeFile {
  SizeFile._();

  /// Func return of Type[String?] used for return validate file or nn
  /// check of nullable file , size and contain type image
  static String validatesize(File? file) {
    if (file == null) return "fichier vide merci de charger L'image";
    int size = file.lengthSync();
    // ignore: avoid_print
    print("========== size file $size =========");
    return "";
  }
}
