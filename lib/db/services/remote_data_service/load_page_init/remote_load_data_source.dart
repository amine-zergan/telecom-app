import 'package:telecom/db/services/core/constants_config.dart';
import 'package:telecom/db/services/remote_data_service/load_page_init/Remote_load_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteConfigPageInit extends IrepositoryConfigPageInit {
  final SharedPreferences preferences;

  RemoteConfigPageInit(this.preferences);
  @override
  String? fetchParamsConfig() {
    final String? configParams = preferences.getString(config);
    return configParams;
  }

  @override
  Future<void> saveParamsConfig(String value) async {
    await preferences.setString(config, value);
  }
}
