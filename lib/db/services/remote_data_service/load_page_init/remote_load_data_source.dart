import 'package:telecom/db/services/remote_data_service/load_page_init/Remote_load_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteConfigPageInit extends IrepositoryConfigPageInit {
  final SharedPreferences preferences;

  RemoteConfigPageInit(this.preferences);
  @override
  String? fetchParamsConfig(String value) {
    final String? configParams = preferences.getString(value);
    return configParams;
  }

  @override
  Future<void> saveParamsConfig(String key, String value) {
    return preferences.setString(key, value);
  }
}
