import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:telecom/db/Remote_DataSource/entreprise/abstract_entreprise_service.dart';
import 'package:telecom/db/Remote_DataSource/entreprise/remote_entreprise_service.dart';
import 'package:telecom/db/helpers/db_helper.dart';

/// create and generate instance of classes in life app cycle
///  package [get_It ] :
/// instance of getIt.insatnce

final getItInstance = GetIt.I;
void setup() {
  getItInstance
      .registerLazySingletonAsync<Database>(() => DbHelper.instance.db);
  getItInstance.registerLazySingleton<IrepositiryEntrepriseSource>(
      () => RemoteEntrepriseDataSourceImpl(getItInstance()));
}
