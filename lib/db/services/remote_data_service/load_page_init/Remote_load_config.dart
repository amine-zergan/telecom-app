// ignore_for_file: file_names

abstract class IrepositoryConfigPageInit {
  Future<void> saveParamsConfig(String key, String value);
  String? fetchParamsConfig(String value);
}
