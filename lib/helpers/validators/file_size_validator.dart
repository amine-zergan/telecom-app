import 'dart:io';

class SizeFile {
  SizeFile._();

  /// Func return of Type[String?] used for return validate file or nn
  /// check of nullable file , size and contain type image
  static String validatesize(File? file) {
    if (file == null) return "fichier vide merci de charger L'image";
    final int size =
        ((file.readAsBytesSync()).lengthInBytes / (1024 * 1024)).floor();
    if (size > 10) return "taille de image doit etre moin de 10 Mo";
    return "";
  }
}
