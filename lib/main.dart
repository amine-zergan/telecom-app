// ignore_for_file: library_prefixes, await_only_futures
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/init.dart';
import 'package:telecom/view/routes/route_name.dart';
import 'package:telecom/view/routes/routes_navigation.dart';
import 'package:telecom/view/theme/theming_app.dart';

void main() async {
  await initialise();
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
    } else if (state == AppLifecycleState.resumed) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Telecom App',
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes, //list<Class widget Page >
      defaultTransition: Transition.fadeIn,
      initialRoute: RouteName.onboard,
      theme: ThemeApp.light,
      darkTheme: ThemeApp.darkTheme(
        context,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
