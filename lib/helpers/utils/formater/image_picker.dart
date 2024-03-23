import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerFile {
  ImagePickerFile._();

  static Future<File?> getImageFromGalery() async {
    try {
      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file == null) return null;
      return File(file.path);
    } on PlatformException {
      return null;
    }
  }

  static Future<File?> getImageFromImage() async {
    try {
      final file = await ImagePicker().pickImage(source: ImageSource.camera);
      if (file == null) return null;
      return File(file.path);
    } on PlatformException {
      return null;
    }
  }
}
