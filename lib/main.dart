import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import 'package:telecom/di/get_it.dart' as getIt;
import 'package:telecom/view/routes/route_name.dart';
import 'package:telecom/view/routes/routes_navigation.dart';
import 'package:telecom/view/theme/theming_app.dart';

void main() {
  getIt
      .setup(); // dependecy injection les classes bch tsirlhom initialise hne ;
  WidgetsFlutterBinding.ensureInitialized(); //preparation pour bind les widgets
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // orientation mt3 app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("============ Material App ============");
    return GetMaterialApp(
      title: 'Telecom App',
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      initialRoute: RouteName.config,
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      themeMode: ThemeMode.system,
      //home: const MyHomePage(title: 'Telecom Application'),
    );
  }
}
