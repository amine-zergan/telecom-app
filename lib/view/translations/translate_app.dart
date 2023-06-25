import 'package:get/get.dart';
import 'package:telecom/view/translations/en_En.dart';
import 'package:telecom/view/translations/fr_Fr.dart';

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "fr": fr,
        "en": en,
      };
}
