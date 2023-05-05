import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telecom/db/Remote_Data_Source/contact/abstract_contact_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/contact/remote_contact_datasource.dart';

import 'package:telecom/db/Remote_Data_Source/entreprise/abstract_entreprise_service.dart';
import 'package:telecom/db/Remote_Data_Source/entreprise/remote_entreprise_service.dart';
import 'package:telecom/db/Remote_Data_Source/profile/abstract_profile_datasource.dart';
import 'package:telecom/db/services/remote_data_service/load_page_init/Remote_load_config.dart';

import '../db/Remote_Data_Source/profile/remote_profile_datasource.dart';
import '../db/services/remote_data_service/load_page_init/remote_load_data_source.dart';

/// create and generate instance of classes in applife cycle
///  package [get_It ] :
/// instance of getIt.insatnce

final getItInstance = GetIt.I;
Future<void> setup() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  // ignore: avoid_print
  print("========== initialse sharedPreference done ===========");
  getItInstance.registerLazySingleton(() => sharedPreferences);

  getItInstance.registerLazySingleton<IrepositoryConfigPageInit>(
    () => RemoteConfigPageInit(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<IrepositoryEntrepriseSource>(
    () => RemoteEntrepriseDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<IrepositroyProfileDataSource>(
    () => RemoteProfileDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<IrepositoryContactDatasource>(
    () => RemoteContactDataSource(),
  );
}
