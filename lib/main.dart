import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import 'package:telecom/di/get_it.dart' as getIt;
import 'package:telecom/view/routes/route_name.dart';
import 'package:telecom/view/routes/routes_navigation.dart';
import 'package:telecom/view/theme/theming_app.dart';

void main() {
  getIt.setup();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Telecom App',
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      defaultTransition: Transition.fadeIn,
      initialRoute: RouteName.onboard,
      theme: ThemeApp.light,
      darkTheme: ThemeApp.darkTheme(context),
      themeMode: ThemeMode.dark,
    );
  }
}
