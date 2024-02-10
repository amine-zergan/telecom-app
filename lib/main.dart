// ignore_for_file: library_prefixes
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart' as getIt;
import 'package:telecom/view/routes/route_name.dart';
import 'package:telecom/view/routes/routes_navigation.dart';
import 'package:telecom/view/theme/theming_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await getIt.setup();
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state==AppLifecycleState.inactive){
//At least one view of the application is visible, but none have input focus.
// The application is otherwise running normally.
    }else if(state==AppLifecycleState.resumed){
      //On all platforms, this state indicates that the
      // application is in the default 
      //running mode for a running application that 
      //has input focus and is visible.
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Telecom App',
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
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
