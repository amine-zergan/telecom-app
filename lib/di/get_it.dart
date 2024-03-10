import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:telecom/db/Remote_Data_Source/articles/abstract_material_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/contact/abstract_contact_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/contact/remote_contact_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/entreprise/abstract_entreprise_service.dart';
import 'package:telecom/db/Remote_Data_Source/entreprise/remote_entreprise_service.dart';
import 'package:telecom/db/Remote_Data_Source/mission/abstract_mission_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/mission/remote_mission_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/profile/abstract_profile_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_operator_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/remote_operator_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/remote_project_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/site/abstract_site_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/site/remote_site_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/tasks/abstract_task_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/tasks/remote_task_datasource.dart';
import 'package:telecom/db/helpers/db_helper.dart';
import 'package:telecom/db/services/cache/filter/filter_service.dart';
import 'package:telecom/db/services/remote_data_service/load_page_init/Remote_load_config.dart';
import 'package:telecom/report/rfi_excel.dart';
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
  getItInstance.registerLazySingleton<ImagePicker>(() => ImagePicker());
  getItInstance.registerLazySingleton<DbHelper>(() => DbHelper());
  getItInstance.registerLazySingleton<IrepositoryConfigPageInit>(
    () => RemoteConfigPageInit(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<FilterServiceRepository>(
    () => RemoteImplFilterServiceRepository(
      preferences: getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<IrepositoryEntrepriseSource>(
    () => RemoteEntrepriseDataSourceImpl(
      helper: getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<IrepositoryOperatorDatasource>(
    () => RemoteOperatorDataSourceImpl(
      helper: getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<IrepositoryProjectDatasource>(
    () => RemoteProjectDataSourceImpl(
      helper: getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<IrepositorySiteDatasource>(
    () => RemoteSiteDataSourceImpl(
      helper: getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<IrepositoryMaterialDataSource>(
    () => RemoteMaterialDataSourceImpl(
      hepler: getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<IrepositroyProfileDataSource>(
    () => RemoteProfileDataSourceImpl(
      helper: getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<IrepositoryContactDatasource>(
    () => RemoteContactDataSourceImpl(
      hepler: getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<IrepositoryTaskDatasource>(
    () => RemoteTaskDataSourceImpl(
      helper: getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<IrepositoryMissionDatasource>(
    () => RemoteMissionDataSourceImpl(
      helper: getItInstance(),
    ),
  );
}
