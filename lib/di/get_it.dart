import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telecom/db/Remote_Data_Source/articles/abstract_material_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/contact/abstract_contact_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/contact/remote_contact_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/entreprise/abstract_entreprise_service.dart';
import 'package:telecom/db/Remote_Data_Source/entreprise/remote_entreprise_service.dart';
import 'package:telecom/db/Remote_Data_Source/profile/abstract_profile_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_operator_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/remote_operator_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/remote_project_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/site/abstract_contact_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/site/remote_contact_datasource.dart';
import 'package:telecom/db/services/remote_data_service/load_page_init/Remote_load_config.dart';
import '../db/Remote_Data_Source/articles/remote_material_datasource.dart';
import '../db/Remote_Data_Source/profile/remote_profile_datasource.dart';
import '../db/services/remote_data_service/load_page_init/remote_load_data_source.dart';

/// create and generate instance of classes in applife cycle
///  package [get_It ] :
/// instance of getIt.insatnce

final getItInstance = GetIt.I;
Future<void> setup() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getItInstance.registerLazySingleton(() => sharedPreferences);

  getItInstance.registerLazySingleton<IrepositoryConfigPageInit>(
    () => RemoteConfigPageInit(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<IrepositoryEntrepriseSource>(
    () => RemoteEntrepriseDataSourceImpl(),
  );

  getItInstance.registerLazySingleton<IrepositoryOperatorDatasource>(
    () => RemoteOperatorDataSourceImpl(),
  );

  getItInstance.registerLazySingleton<IrepositoryProjectDatasource>(
    () => RemoteProjectDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<IrepositorySiteDatasource>(
    () => RemoteSiteDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<IrepositoryMaterialDataSource>(
    () => RemoteMaterialDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<IrepositroyProfileDataSource>(
    () => RemoteProfileDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<IrepositoryContactDatasource>(
    () => RemoteContactDataSourceImpl(),
  );
}
