import 'package:get_it/get_it.dart';

/// create and generate instance of classes in life app cycle
///  package [get_It ] :
/// instance of getIt.insatnce

final getIt = GetIt.instance;

void setup() {
  // ignore: avoid_print
  print("============ create di for project ================");

  /// exemple : getIt.registerSingleton<AppModel>(AppModel());
}
