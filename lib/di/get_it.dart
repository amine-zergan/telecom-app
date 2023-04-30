import 'package:get_it/get_it.dart';

import 'package:telecom/db/Remote_DataSource/entreprise/abstract_entreprise_service.dart';
import 'package:telecom/db/Remote_DataSource/entreprise/remote_entreprise_service.dart';
import 'package:telecom/db/Remote_DataSource/profile/abstract_profile_datasource.dart';

import '../db/Remote_DataSource/profile/remote_profile_datasource.dart';

/// create and generate instance of classes in life app cycle
///  package [get_It ] :
/// instance of getIt.insatnce

final getItInstance = GetIt.I;
Future<void> setup() async {
  getItInstance.registerLazySingleton<IrepositoryEntrepriseSource>(
    () => RemoteEntrepriseDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<IrepositroyProfileDataSource>(
    () => RemoteProfileDataSourceImpl(),
  );
}
