import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class ImageConvert {
  ImageConvert._();

  /// Func return nullable type of [String] use for fetch
  /// file? from package image Picker
  /// Read the File injected and convert them in Unit8List byte
  /// convert from [Byte] to [String]
  static String? base64convert(File? file) {
    if (file == null) return null;
    final Uint8List data = file.readAsBytesSync();
    return base64Encode(data);
  }

  /// Func return nullable type of [Unit8List] use for
  /// convert [String] to [Unit8List] type
  static Uint8List? decode(String? data) {
    if (data == null) return null;
    return base64Decode(data);
  }
}
